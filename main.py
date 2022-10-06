import logging

import functions_framework
from flask import Response
from app.models import UserList
from app.router import get_all_users


cached_data = {}


@functions_framework.http
def getAllUsers(request):
    KEY = "ALL_USERS"
    if KEY in cached_data:
        return cached_data[KEY]
    users = get_all_users()
    response = Response(
        response=UserList(__root__=users).json(),
        status=200,
        content_type="application/json",
    )
    cached_data[KEY] = response
    return cached_data[KEY]


if __name__ == "__main__":
    print(getAllUsers())
