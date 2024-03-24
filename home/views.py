from django.shortcuts import render
from .models import Note


# Create your views here.
from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.


def note_list(request):
    Data = {'Notes': Note.objects.all().order_by('-date_modified')}
    return render(request, 'pages/home.html', Data) 


def index(request):
    return render(request, 'pages/home.html')
