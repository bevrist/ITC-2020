from django.shortcuts import render

# Create your views here.
def help(request):
    return render(request, 'help.html')

def upload(request):
    return render(request, 'uploadpage.html')

def index(request):
    return render(request, 'rootpage2.html')