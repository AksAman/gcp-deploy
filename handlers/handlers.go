package handlers

import (
	"encoding/json"
	"fmt"
	"net/http"
	"sort"
	"strconv"

	"github.com/gophercises/gogcp/models"
	"github.com/gorilla/mux"
)

var users map[int]models.User = map[int]models.User{
	1: {ID: 1, Name: "Doe", Age: 20},
	2: {ID: 2, Name: "Mike", Age: 30},
	3: {ID: 3, Name: "Bob", Age: 40},
}

func GetAllUsers(w http.ResponseWriter, r *http.Request) {
	usersList := []models.User{}
	for _, user := range users {
		usersList = append(usersList, user)
	}
	// sort by id
	sort.Slice(usersList, func(i, j int) bool {
		return usersList[i].ID < usersList[j].ID
	})
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
	var user models.User
	err := json.NewDecoder(r.Body).Decode(&user)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		fmt.Fprintf(w, "invalid user object")
		return
	}
	if _, exists := users[user.ID]; exists {
		http.Error(w, fmt.Sprintf("models.User with ID %d already exists", user.ID), http.StatusBadRequest)
		return
	}
	users[user.ID] = user
	w.WriteHeader(http.StatusCreated)
	json.NewEncoder(w).Encode(user)
}
