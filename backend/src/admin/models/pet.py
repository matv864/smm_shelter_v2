from fastadmin import WidgetType, register

from src.adapters.database.models import Pet
from src.adapters.database.repositories import PetRepository, PetContentRepository
from src.admin.override_fastadmin import CustomModelAdmin, ContentParameter
from src.schemas.admin.pet import (
    PetCreate,
    PetUpdate,
    PetGet,
    PetList,
)


@register(Pet)
class PetAdmin(CustomModelAdmin):
    Pet.__name__ = verbose_name = verbose_name_plural = "Питомцы"
    
    schemaCreate = PetCreate
    schemaUpdate = PetUpdate
    schemaGet = PetGet
    schemaList = PetList
    
    content_parameters = [
        ContentParameter(
            content_repository=PetContentRepository,
            relation_id_field_name="pet_id",
        )
    ]


    model_repository = PetRepository

    list_display = ("name", "gender", "sterilized")
    list_display_links = ("name",)
    list_filter = ("name", "gender", "sterilized")

    search_fields = (
        "name", "gender", "sterilized"
    )


    fieldsets = (
        (
            None,
            {
                "fields": (
                    "name",
                    "gender",
                    "description",
                    "sterilized",
                    "images",
                )
            },
        ),
    )
    formfield_overrides = {  # noqa: RUF012
        "name": (WidgetType.Input, {"required": True}),
        "description": (WidgetType.RichTextArea, {"required": False}),
        "sterilized": (WidgetType.Checkbox, {"required": False, "default": False}),
        "images": (WidgetType.Upload, {"required": False, "multiple": True}),
    }
