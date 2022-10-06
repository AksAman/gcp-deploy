import logging
from app.router import get_all_users
from app.models import UserList

logger = logging.getLogger(__name__)


headers = {
    "Content-Type": "application/json",
}


def getAllUsers(request):
    logger.info(f"{type(request)=}")
    logger.info(f"{dir(request)=}")
    users = get_all_users()
    return (UserList(__root__=users).to_json(), 200, headers)


if __name__ == "__main__":
    print(getAllUsers())
