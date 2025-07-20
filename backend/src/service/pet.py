from src.unit_of_work import UnitOfWork

class PetService:
    def __init__(self, uow: UnitOfWork):
        self.uow = uow
    
    async def get_pets(
        self,
        type_of_pet: int | None,
        page: int,
        limit: int
    ):
        return [dict()]
    
    async def get_one_pet(self, id: int):
        return dict()

