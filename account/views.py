from django.shortcuts import render, redirect
from django.contrib.auth import logout
from django.contrib import messages
from .models import User

# Create your views here.


def login_user(request):
    if request.method == "POST" and 'username' in request.POST and 'password' in request.POST:
        username = request.POST['username']
        password = request.POST['password']
        user = User.get_user_by_username(username)
        print(user)
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
