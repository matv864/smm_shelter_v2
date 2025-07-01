from fastadmin import WidgetType, register

from src.adapters.database.models import Transaction
from src.adapters.database.repositories import TransactionRepository, TransactionContentRepository
from src.admin.override_fastadmin import CustomModelAdmin, ContentParameter
from src.schemas.admin.transaction import (
    TransactionCreate,
    TransactionUpdate,
    TransactionGet,
    TransactionList,
)


@register(Transaction)
class NewsAdmin(CustomModelAdmin):
    Transaction.__name__ = verbose_name = verbose_name_plural = "Транзакции"
    
    schemaCreate = TransactionCreate
    schemaUpdate = TransactionUpdate
    schemaGet = TransactionGet
    schemaList = TransactionList
    
    content_parameters = [
        ContentParameter(
            content_repository=TransactionContentRepository,
            relation_id_field_name="transaction_id",
        )
    ]


    model_repository = TransactionRepository

    list_display = ("amount", "sender_receiver", "comment")
    list_display_links = ("amount", "sender_receiver")
    list_filter = ("amount", "sender_receiver", "comment")

    search_fields = ("amount", "sender_receiver", "comment")

    fieldsets = (
        (
            None,
            {
                "fields": (
                    "date_of_payment",
                    "amount",
                    "sender_receiver",
                    "comment",
                    "images",
                )
            },
        ),
    )
    formfield_overrides = {  # noqa: RUF012
        "date_of_payment": (WidgetType.DateTimePicker, {"required": False}),
        "amount": (WidgetType.InputNumber, {"required": True}),
        "title": (WidgetType.Input, {"required": True}),
        "sender_receiver": (WidgetType.Input, {"required": False}),
        "comment": (WidgetType.RichTextArea, {"required": False}),
        "images": (WidgetType.Upload, {"required": False, "multiple": True}),
    }
