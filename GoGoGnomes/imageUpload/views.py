from django.shortcuts import render
from django.core.files.storage import FileSystemStorage

def imageUpload(request):

    if request.method == 'GET':
        print('GET')

    if request.method == 'POST':
        print('POST')
        selection = request.POST['selection']
        print(selection)
        uploaded_image = request.FILES['img']
        print('SUCCESS')
        fs = FileSystemStorage()
        fs.save(uploaded_image.name, uploaded_image)
        print('SAVED')

    return render(request, 'uploadpage.html')