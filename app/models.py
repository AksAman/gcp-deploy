from typing import List
from pydantic import BaseModel


class User(BaseModel):
    id: int
    name: str
    age: int


class UserList(BaseModel):
    __root__: List[User]

    def to_json(self):
        return self.json()
