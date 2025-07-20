from typing import Annotated
from fastapi import APIRouter, Query, Path, Depends

from src.unit_of_work import UnitOfWork
from src.service import NewsService

news_router = APIRouter(prefix="/news", tags=["News"])

@news_router.get(
    "/list"
)
async def get_news(
    uow: Annotated[UnitOfWork, Depends(UnitOfWork)],
    page: Annotated[int, Query()] = 1,
    limit: Annotated[int, Query()] = 20,
):
    return await NewsService(uow).get_news(
        page=page,
        limit=limit,
    )


@news_router.get(
    "/one/{id}"
)
async def get_one_news(
    uow: Annotated[UnitOfWork, Depends(UnitOfWork)],
    id: Annotated[int, Path()],
):
    return await NewsService(uow).get_one_news(id=id)
