from django.shortcuts import render
from django.core.files.storage import FileSystemStorage
from PIL import Image
import base64
import io

from .models import Samplecards, Holidays

def imageUpload(request):
    if request.method == 'POST':
        selection = request.POST['selection']

        if selection == "Christmas":
            holiday_id = 12
        elif selection == "Thanksgiving":
            holiday_id = 10
        elif selection == "Mothers Day":
            holiday_id = 4
        elif selection == "Easter":
            holiday_id = 5
        elif selection == "Fourth of July":
            holiday_id = 7
        elif selection == "Fathers Day":
            holiday_id = 6
        elif selection == "Halloween":
            holiday_id = 8
        elif selection == "Valentines Day":
            holiday_id = 2
        elif selection == "Saint Patricks Day":
            holiday_id = 3
        elif selection == "New Years":
            holiday_id = 1
        elif selection == "Hanukkah":
            holiday_id = 11
        elif selection == "Kwanzaa":
            holiday_id = 13
        elif selection == "Diwali":
            holiday_id = 9
        else:
            None

        itr = 0

        for x in Samplecards.objects.filter(holidayid=holiday_id):
            sample = x
            theImage = io.BytesIO(sample.image)
            holidayID = sample.holidayid
            print(holidayID)
            print("DONE")

            uploaded_image = request.FILES['img']

            foreground = Image.open(uploaded_image).convert("RGBA")
            background = Image.open(theImage).convert("RGBA")

            background.paste(foreground, (440, 190), foreground)
            print(itr)
            background.save(("{0}"+str(itr)+".png").format("./media/image"))
            itr += 1

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

def upload(request):
    return render(request, 'uploadpage.html')

def index(request):
    return render(render, 'rootpage2.html')