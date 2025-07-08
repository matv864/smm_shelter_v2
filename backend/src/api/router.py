from fastapi import APIRouter

from .versions import v1_router, v2_router
from .healthcheck import healthcheck_router

main_router = APIRouter(prefix="/api")

main_router.include_router(healthcheck_router, tags=["Health"])

main_router.include_router(v1_router, tags=["v1"])
main_router.include_router(v2_router, tags=["v2"])
