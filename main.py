import logging

import functions_framework
from flask import Response
from app.models import UserList
from app.router import get_all_users


@functions_framework.http
def getAllUsers(request):
    users = get_all_users()
    return Response(
        response=UserList(users).json(),
        status=200,
        content_type="application/json",
    )


if __name__ == "__main__":
    print(getAllUsers())
