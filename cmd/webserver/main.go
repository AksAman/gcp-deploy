package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"

	"github.com/AksAman/gogcp/handlers"
	"github.com/AksAman/gogcp/utils"
	"github.com/gorilla/mux"
)

var (
	port = flag.Int("port", utils.GetEnv("PORT", 8080), "port to listen on")
)

func init() {
	flag.Parse()
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

	apiRoute.HandleFunc("/users", handlers.GetAllUsers).Methods("GET")
	apiRoute.HandleFunc("/users/{id}", handlers.GetUser).Methods("GET")
	apiRoute.HandleFunc("/users", handlers.AddUser).Methods("POST")

	addr := fmt.Sprintf(":%d", *port)
	log.Printf("Listening on %s\n", addr)
	log.Fatal(http.ListenAndServe(addr, router))
}
