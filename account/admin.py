from django.contrib import admin
from home.models import User

# Register your models here.


class ViewUser(admin.ModelAdmin):
    list_display = ['username', 'password']


admin.site.register(User, ViewUser)
