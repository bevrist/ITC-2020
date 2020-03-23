from django.shortcuts import render
from django.core.files.storage import FileSystemStorage

# Create your views here.
def upload(request):
    if request.method == 'POST':
        uploaded_file = request.FILES['img']
        fs = FileSystemStorage()
        fs.save(uploaded_file.name, uploaded_file)
    return render(request, "uploadpage.html")