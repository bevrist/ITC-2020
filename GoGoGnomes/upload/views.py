from django.shortcuts import render
from django.core.files.storage import FileSystemStorage

# Create your views here.
def upload(request):
    return render(request, "uploadpage.html")