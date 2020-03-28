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
        if selection == "christmas":           
            foreground = Image.open(uploaded_image).convert("RGBA").resize((950,550))
            background = Image.open("/workspace/GoGoGnomes/static/images/Christmas/c1Blank.png").convert("RGBA")
            background.paste(foreground, (440,190), foreground)
            background.save("./media/new-image1.png")

            background = Image.open("/workspace/GoGoGnomes/static/images/Christmas/c2Blank.png").convert("RGBA")
            background.paste(foreground, (440,190), foreground)
            background.save("./media/new-image2.png")

            background = Image.open("/workspace/GoGoGnomes/static/images/Christmas/c3Blank.png").convert("RGBA")
            background.paste(foreground, (440,190), foreground)
            background.save("./media/new-image3.png")

            background = Image.open("/workspace/GoGoGnomes/static/images/Christmas/c4Blank.png").convert("RGBA")
            background.paste(foreground, (440,190), foreground)
            background.save("./media/new-image4.png")

            background = Image.open("/workspace/GoGoGnomes/static/images/Christmas/c5Blank.png").convert("RGBA")
            background.paste(foreground, (440,190), foreground)
            background.save("./media/new-image5.png")

    print("GRABBED")    
    return render(request, 'uploadpage.html')