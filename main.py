from app.router import get_all_users
from app.models import UserList
import flask
from flask import Request

headers = {
    "Content-Type": "application/json",
}


def getAllUsers(request: Request):
    users = get_all_users()
    return (UserList(__root__=users).to_json(), 200, headers)


if __name__ == "__main__":
    print(getAllUsers())
