from django.shortcuts import render
from django.core.files.storage import FileSystemStorage
from PIL import Image

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

    foreground = Image.open(uploaded_image).convert("RGBA").resize((1050,480))
    background = Image.open("/workspace/GoGoGnomes/static/images/c1.png").convert("RGBA")

    print("GRABBED")

    background.paste(foreground, (437,213), foreground)
    background.save("/workspace/GoGoGnomes/media/new-image.png")
    return render(request, 'uploadpage.html')