from django.shortcuts import render
from .models import Note


# Create your views here.
from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.


def note_list(request):
    # Query all notes and order by date_modified
    # Data = {'Notes': Note.objects.all().order_by('-date_modified')}

    # Query all notes of userthihong@example.com and order by date_modified
    Data = {'Notes': Note.objects.filter(username="thihong@example.com").order_by('-date_modified')}
    return render(request, 'pages/home.html', Data) 


def index(request):
    return render(request, 'pages/home.html')
