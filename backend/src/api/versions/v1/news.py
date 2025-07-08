from typing import Annotated
from fastapi import APIRouter, Query, Path

news_router = APIRouter(prefix="/news", tags=["Newws"])

@news_router.get(
    "/list"
)
async def get_news(
    page: Annotated[int, Query()] = 1,
    limit: Annotated[int, Query()] = 20,
):
    return []


@news_router.get(
    "/one/{id}"
)
async def get_one_news(
    id: Annotated[int, Path()],
):
    return dict()
