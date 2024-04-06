from django.shortcuts import render, redirect
from django.http import Http404
from home.models import Note, User
from django.utils import timezone
from django.http import JsonResponse
from django.contrib import messages
# Create your views here.


def get_note(request):
    note_id = request.GET.get('note_id')
    note = Note.objects.get(id=note_id)
    return render(request, 'pages/note-edit.html', {'note': note})


def add_note(request):
    note = Note()
    user = User.objects.get(username=request.session.get('username'))
    note.username = user
    note.title = ''
    note.content = ''
    note.date_modified = timezone.now()
    note.date_created = timezone.now()
    note.save()
    note_id = note.id
    messages.success(request, 'Note added successfully')
    return redirect(f'./edit?note_id={note_id}')


def delete_note(request):
    note_id = request.GET.get('note_id')
    note = Note.objects.get(id=note_id)
    note.delete()
    messages.success(request, 'Note deleted successfully')
    return redirect('home')


def edit_note(request):
    if request.method == 'POST':
        title = request.POST.get('title')
        content = request.POST.get('content')

        note_id = request.GET.get('note_id')

        if not note_id:
            raise Http404("Note ID parameter not found in the URL")

        try:
            note = Note.objects.get(id=note_id)
        except Note.DoesNotExist:
            raise Http404("Note does not exist")

        note.title = title
        note.content = content
        note.date_modified = timezone.now()
        note.save()
        messages.success(request, 'Note saved successfully')
        return redirect('home')
    else:
        # Handle GET requests (if any)
        pass


def get_system_reply(request):
    if request.method == 'POST':
        user_message = request.POST.get('user_message')
        # Process user's message and generate system's reply
        system_reply = "This is a sample system reply, you said: " + user_message
        return JsonResponse({'system_reply': system_reply})
    else:
        return JsonResponse({'error': 'Method not allowed'}, status=405)
