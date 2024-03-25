from django.shortcuts import render
from django.http import HttpResponse
from .models import Note
from django.db.models import Q
# Create your views here.


def note_list(request):
    # Query all notes and order by date_modified
    # Data = {'Notes': Note.objects.all().order_by('-date_modified')}

    # Query all notes of userthihong@example.com and order by date_modified
    Data = {'Notes': Note.objects.filter(
        username="thihong@example.com").order_by('-date_modified')}
    return render(request, 'pages/home.html', Data)


def find_note(request):
    query = request.GET.get('query', '').strip()
    if query == '':
        return render(request, 'pages/home.html')
    else:
        Data = {
            'Notes': Note.objects.filter(
                Q(title__icontains=query) | Q(content__icontains=query),
                username="thihong@example.com"
            ).order_by('-date_modified')
        }
        return render(request, 'pages/home.html', Data)


def index(request):
    return render(request, 'pages/home.html')
