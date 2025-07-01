from datetime import datetime

from pydantic import BaseModel


class TransactionCreate(BaseModel):
    date_of_payment: datetime | None = None
    amount: int
    sender_receiver: str | None = None
    comment: str | None = None


class TransactionUpdate(BaseModel):
    date_of_payment: datetime | None = None
    amount: int | None = None
    sender_receiver: str | None = None
    comment: str | None = None


class TransactionGet(BaseModel):
    id: int
    date_of_payment: datetime | None = None
    amount: int
    sender_receiver: str | None = None
    comment: str | None = None


class TransactionList(BaseModel):
    id: int
    date_of_payment: datetime | None = None
    amount: int
    sender_receiver: str | None = None
    comment: str | None = None
