from app.router import get_all_users
from app.models import UserList
import flask
from flask import Request


def getAllUsers(request: Request):
    users = get_all_users()
    return UserList(__root__=users).to_json()


if __name__ == "__main__":
    print(getAllUsers())
