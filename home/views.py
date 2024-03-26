from django.shortcuts import render, redirect
from .models import Note
from django.db.models import Q
# Create your views here.

# def index(request):
#     return render(request, 'pages/home.html')


def is_logged_in(request):
    return 'username' in request.session


def check_login(view_func):
    def wrapped_view(request, *args, **kwargs):
        if is_logged_in(request):
            return view_func(request, *args, **kwargs)
        else:
            return redirect('login')
    return wrapped_view


@check_login
def home(request):
    Data = {'Notes': Note.objects.filter(
        username=request.session['username']).order_by('-date_modified')}
    return render(request, 'pages/home.html', Data)


@check_login
def find_note(request):
    query = request.GET.get('query', '').strip()
    if query == '':
        return render(request, 'pages/home.html')
    else:
        Data = {
            'Notes': Note.objects.filter(
                Q(title__icontains=query) | Q(content__icontains=query),
                username=request.session['username']
            ).order_by('-date_modified')
        }
        return render(request, 'pages/home.html', Data)
