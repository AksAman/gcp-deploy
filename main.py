import logging

import functions_framework

from google.cloud import logging as cloudlogging

from app.models import UserList
from app.router import get_all_users

lg_client = cloudlogging.Client()
lg_client.setup_logging(log_level=logging.INFO)
logger = logging.getLogger(__name__)

headers = {
    "Content-Type": "application/json",
}


@functions_framework.http
def getAllUsers(request):
    logger.info(f"CUSTOM LOG: {type(request)=}")
    logger.info(f"CUSTOM LOG: {dir(request)=}")
    users = get_all_users()
    return (UserList(__root__=users).to_json(), 200, headers)


if __name__ == "__main__":
    print(getAllUsers())
