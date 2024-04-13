import json
import os
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt
from django.http import Http404
from home.models import Note, User
from django.utils import timezone
from django.http import JsonResponse
from django.contrib import messages
from google.cloud import translate_v2
from langchain_openai import ChatOpenAI
from langchain_core.messages import HumanMessage
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


@csrf_exempt
def chat(request):
    OPENAI_API_KEY = os.environ.get("OPENAI_API_KEY")
    chat = ChatOpenAI(openai_api_key=OPENAI_API_KEY)
    if request.method == 'POST':
        data = json.loads(request.body)
        note_content = data.get('note_content')
        note_content = "I have a note which contains the following content: \n" + note_content + \
            "\n\n" + \
            "Sumarize the note for me (in bullet • or numbering format if neccessary) in the language that I had written in the content. No yapping, Limit prose, No fluff."
        response = chat.invoke(
            [
                HumanMessage(
                    content=note_content
                )
            ]
        ).to_json()['kwargs']['content']
        print(response)
        return JsonResponse({'summarization': response})
    else:
        return JsonResponse({'error': 'Method not allowed'}, status=405)


def translate_note(request):
    if request.method == "POST":
        note_id = request.GET.get('note_id')
        note = Note.objects.get(id=note_id)
        note_title = note.title
        note_content = note.content
        if note_content:
            source_language = request.POST.get('source_language')
            target_language = request.POST.get('target_language')

            if source_language != target_language:
                translate_client = translate_v2.Client()
                translation = translate_client.translate(
                    values=note_content, source_language=source_language ,target_language=target_language
                )
                translated_text = translation['translatedText']

                note_translated = Note()
                user = User.objects.get(username=request.session.get('username'))
                note_translated.username = user
                note_translated.title = "Translation of " + note_title
                note_translated.content = translated_text
                note_translated.date_modified = timezone.now()
                note_translated.date_created = timezone.now()
                note_translated.save()

                messages.success(request, 'Note translated successfully.')
                return redirect('home')
            else:
                messages.warning(request, 'Looks like you chose the same language for translation. Please select different languages to translate the note.')
                return redirect(f'./edit?note_id={note_id}')
        else:
            messages.warning(request, 'Note has no content to translate. Please save the note and try again.')
            return redirect(f'./edit?note_id={note_id}')
    else:
        pass