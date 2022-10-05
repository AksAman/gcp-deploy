from typing import Dict, Union
from fastapi import APIRouter

from app.models import User


router = APIRouter(
    prefix="/api",
    tags=["api"],
    responses={404: {"description": "Not found"}},
)

users: Dict[int, User] = {
    1: User(id=1, name="John", age=20),
    2: User(id=2, name="Mike", age=30),
    3: User(id=3, name="Bob", age=40),
}


@router.get("/users")
def get_all_users():
    return list(users.values())


@router.get("/users/{user_id}")
def get_user(user_id: int):
    if user_id in users:
        return users[user_id]
    return {"error": "User not found"}


@router.post("/users")
def create_user(user: User):
    if user.id in users:
        return {"error": "User already exists"}
    users[user.id] = user
    return user
