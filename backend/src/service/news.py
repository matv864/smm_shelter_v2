from src.unit_of_work import UnitOfWork

class NewsService:
    def __init__(self, uow: UnitOfWork):
        self.uow = uow
    
    async def get_news(
        self,
        page: int,
        limit: int
    ):
        return [dict()]
    
    async def get_one_news(self, id: int):
        return dict()

