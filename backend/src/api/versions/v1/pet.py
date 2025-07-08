from typing import Annotated
from fastapi import APIRouter, Query, Path

pet_router = APIRouter(prefix="/pet", tags=["Pets"])

@pet_router.get(
    "/list"
)
async def get_pets(
    type_of_pet: Annotated[int | None, Query()] = None,
    page: Annotated[int, Query()] = 1,
    limit: Annotated[int, Query()] = 20,
):
    return []


@pet_router.get(
    "/one/{id}"
)
async def get_one_pet(
    id: Annotated[int, Path()],
):
    return dict()
