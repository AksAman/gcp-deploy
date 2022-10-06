from app.router import get_all_users
from app.models import UserList
from google.cloud import logging as cloudlogging
import logging

lg_client = cloudlogging.Client()
lg_client.setup_logging(log_level=logging.INFO)
logger = logging.getLogger(__name__)

headers = {
    "Content-Type": "application/json",
}


def getAllUsers(request):
    logger.info(f"CUSTOM LOG: {type(request)=}")
    logger.info(f"CUSTOM LOG: {dir(request)=}")
    print(f"CUSTOM PRINT: {type(request)=}")
    print(f"CUSTOM PRINT: {dir(request)=}")
    users = get_all_users()
    return (UserList(__root__=users).to_json(), 200, headers)


if __name__ == "__main__":
    print(getAllUsers())
