from sqlalchemy.orm import Mapped

from .base import Base


class Status(Base):
    __tablename__ = "status"

    name: Mapped[str]

    def __str__(self):
        return f"{self.name}"
