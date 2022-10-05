package gogcp

import (
	"net/http"

	"github.com/AksAman/gogcp/handlers"
)

func FuncGetAllUsers(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	handlers.GetAllUsers(w, r)
}
