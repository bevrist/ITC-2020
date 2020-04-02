from django.shortcuts import render
from django.core.files.storage import FileSystemStorage
from PIL import Image
import base64
import io

from .models import Samplecards

def imageUpload(request):
    if request.method == 'POST':
        selection = request.POST['selection']
        sample = getImage()
        theImage = io.BytesIO(sample.image)
        print("DONE")

        uploaded_image = request.FILES['img']

        foreground = Image.open(uploaded_image).convert("RGBA")
        background = Image.open(theImage).convert("RGBA")

        background.paste(foreground, (440, 190), foreground)
        background.save("./media/new-image1.png")

        fs = FileSystemStorage()
        fs.save(uploaded_image.name, uploaded_image)
        '''if selection == "christmas":           
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
        '''
  
    return render(request, 'uploadpage.html')

def getImage():
    img = Samplecards.objects.get(image_id=1)
    return img