from typing import Annotated
from fastapi import APIRouter, Query, Path, Depends

from src.unit_of_work import UnitOfWork
from src.service import PetService

pet_router = APIRouter(prefix="/pet", tags=["Pets"])

@pet_router.get(
    "/list"
)
async def get_pets(
    uow: Annotated[UnitOfWork, Depends(UnitOfWork)],
    type_of_pet: Annotated[int | None, Query()] = None,
    page: Annotated[int, Query()] = 1,
    limit: Annotated[int, Query()] = 20,
):
    async with uow:
        return await PetService(uow).get_pets(
            type_of_pet=type_of_pet,
            page=page,
            limit=limit,
        )


@pet_router.get(
    "/one/{id}"
)
async def get_one_pet(
    uow: Annotated[UnitOfWork, Depends(UnitOfWork)],
    id: Annotated[int, Path()],
):
    async with uow:
        return await PetService(uow).get_one_pet(
            id=id
        )
