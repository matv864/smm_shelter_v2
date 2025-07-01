from uuid import UUID, uuid4
from datetime import date

from sqlalchemy import Text, String, ForeignKey
from sqlalchemy.dialects.postgresql import ARRAY
from sqlalchemy.orm import Mapped, mapped_column, relationship

from .base import Base, BaseContent


class Transaction(Base):
    __tablename__ = "transaction"

    id: Mapped[UUID] = mapped_column(
        primary_key=True,
        default=uuid4
    )

    date_of_payment: Mapped[date] = mapped_column(default=date.today())

    amount: Mapped[str]
    sender_receiver: Mapped[str | None] = mapped_column(default=None)
    comment: Mapped[str | None] = mapped_column(Text, default=None)
    
    contents: Mapped[list["TransactionContent"]] = relationship(
        back_populates="transaction", lazy="selectin", cascade="all, delete-orphan"
    )
    
    images: Mapped[list[str]] = mapped_column(ARRAY(String), nullable=True)

    def __str__(self):
        return f"{self.comment}"


class TransactionContent(BaseContent):
    __tablename__ = "transactionContent"
    transaction_id: Mapped[int] = mapped_column(ForeignKey("transaction.id"))
    transaction = relationship(
        "Transaction",
        back_populates="contents",
    )
