package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gophercises/gogcp/utils"
	"github.com/gorilla/mux"
)

var (
	port = flag.Int("port", utils.GetEnv("PORT", 8080), "port to listen on")
)

type User struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
	Age  int    `json:"age"`
}

var users map[int]User = map[int]User{
	1: {ID: 1, Name: "John", Age: 20},
	2: {ID: 2, Name: "Mike", Age: 30},
	3: {ID: 3, Name: "Bob", Age: 40},
}

func init() {
	flag.Parse()
}

func GetAllUsers(w http.ResponseWriter, r *http.Request) {
	usersList := []User{}
	for _, user := range users {
		usersList = append(usersList, user)
	}
	json.NewEncoder(w).Encode(usersList)
}

func GetUser(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	idStr, idFound := params["id"]
	if !idFound {
		w.WriteHeader(http.StatusBadRequest)
		fmt.Fprintf(w, "id is required")
		return
	}

	id, err := strconv.Atoi(idStr)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		fmt.Fprintf(w, "id must be an integer")
		return
	}

	user, ok := users[id]
	if !ok {
		w.WriteHeader(http.StatusNotFound)
		return
	}
	json.NewEncoder(w).Encode(user)
}

func AddUser(w http.ResponseWriter, r *http.Request) {
	var user User
	err := json.NewDecoder(r.Body).Decode(&user)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		fmt.Fprintf(w, "invalid user object")
		return
	}
	if _, exists := users[user.ID]; exists {
		http.Error(w, fmt.Sprintf("User with ID %d already exists", user.ID), http.StatusBadRequest)
		return
	}
	users[user.ID] = user
	w.WriteHeader(http.StatusCreated)
	json.NewEncoder(w).Encode(user)
}

func loggerMW(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		log.Printf("%s %s", r.Method, r.URL.Path)
		next.ServeHTTP(w, r)
	})
}

func main() {

	router := mux.NewRouter()
	router.Use(loggerMW)

	apiRoute := router.PathPrefix("/api").Subrouter()

	apiRoute.Use(func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			w.Header().Set("Content-Type", "application/json")
			next.ServeHTTP(w, r)
		})
	})

	apiRoute.HandleFunc("/users", GetAllUsers).Methods("GET")
	apiRoute.HandleFunc("/users/{id}", GetUser).Methods("GET")
	apiRoute.HandleFunc("/users", AddUser).Methods("POST")

	addr := fmt.Sprintf(":%d", *port)
	log.Printf("Listening on %s\n", addr)
	log.Fatal(http.ListenAndServe(addr, router))
}
