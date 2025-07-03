from pydantic import BaseModel


class PetCreate(BaseModel):
    pass


class PetUpdate(BaseModel):
    pass


class PetGet(BaseModel):
    id: int


class PetList(BaseModel):
    id: int
