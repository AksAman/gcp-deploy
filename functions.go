package gogcp

import (
	"net/http"

	"github.com/AksAman/gogcp/handlers"
)

func FuncGetAllUsers(w http.ResponseWriter, r *http.Request) {
	handlers.GetAllUsers(w, r)
}
