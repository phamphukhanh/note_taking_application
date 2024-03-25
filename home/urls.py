from django.urls import path
from . import views

urlpatterns = [
    path('', views.note_list),
    path('search/', views.find_note, name='find_note'),
]
