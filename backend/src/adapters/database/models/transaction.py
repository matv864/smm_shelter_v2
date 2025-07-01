from datetime import date

from sqlalchemy import ForeignKey, String, Text
from sqlalchemy.dialects.postgresql import ARRAY
from sqlalchemy.orm import Mapped, mapped_column, relationship

from .base import Base, BaseContent


class Transaction(Base):
    __tablename__ = "transaction"

    date_of_payment: Mapped[date] = mapped_column(default=date.today())

    amount: Mapped[int]
    sender_receiver: Mapped[str] = mapped_column(nullable=True, default=None)
    comment: Mapped[str] = mapped_column(Text, nullable=True, default=None)

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
