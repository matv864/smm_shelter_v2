from sqlalchemy.ext.asyncio import AsyncSession

from src.adapters.database.repositories import (
    ArticleRepository,
    ArticleContentRepository,
    ManagerRepository,
    NewsRepository,
    NewsContentRepository,
    PetRepository,
    PetContentRepository,
    PetTypeRepository,
    PetStatusRepository,
    TransactionRepository,
    TransactionContentRepository,
)


class RepositoriesGateway:
    def __init__(self, session: AsyncSession):
        self.article = ArticleRepository(session)
        self.article_content = ArticleContentRepository(session)
        self.manager = ManagerRepository(session)
        self.news = NewsRepository(session)
        self.news_content = NewsContentRepository(session)
        self.pet = PetRepository(session)
        self.pet_content = PetContentRepository(session)
        self.pet_type = PetTypeRepository(session)
        self.pet_status = PetStatusRepository(session)
        self.transaction = TransactionRepository(session)
        self.transaction_content = TransactionContentRepository(session)