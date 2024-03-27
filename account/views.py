from django.shortcuts import render, redirect
from django.contrib.auth import logout
from django.contrib import messages
from home.models import User
import hashlib
# Create your views here.


def login_user(request):
    if request.method == "POST" and 'username' in request.POST and 'password' in request.POST:
        username = request.POST['username']
        password = hashlib.sha256(request.POST['password'].encode('utf-8')).hexdigest()
        user = User.get_user_by_username(username)
        if user is not None and user.password == password:
            request.session['username'] = user.username
            request.session['name'] = user.name
            return redirect('/home')
        else:
            messages.error(request, 'Username or password is incorrect')
            return render(request, 'pages/login.html', {})
    else:
        return render(request, 'pages/login.html', {})


def logout_user(request):
    logout(request)
    return redirect('login')


def register_user(request):
    if request.method == "POST":

        username = request.POST['username']

        if User.get_user_by_username(username) is not None:
            messages.error(
                request, 'Username already exists, please try another one')
            return render(request, 'pages/register.html', {})

        password = hashlib.sha256(request.POST['password'].encode('utf-8')).hexdigest()
        name = request.POST['name']
        phone = request.POST['phone']

        user = User(username=username, password=password,
                    name=name, phone=phone)
        user.save()

        messages.success(request, 'User registered successfully')
        return redirect('login')
    else:
        return render(request, 'pages/register.html', {})
