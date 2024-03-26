from django.contrib import admin
from .models import User

# Register your models here.


class ViewUser(admin.ModelAdmin):
    list_display = ['username', 'password']


admin.site.register(User, ViewUser)
