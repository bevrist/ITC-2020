from django.shortcuts import render
from django.core.files.storage import FileSystemStorage
from PIL import Image, ImageOps
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
            resizedForeground = foreground.resize((sample.resize_img_len, sample.resize_img_wid))
            img_with_border = ImageOps.expand(resizedForeground,border=10,fill='white')
            background = Image.open(theImage).convert("RGBA")
            background.paste(img_with_border, (sample.user_img_pos_x, sample.user_img_pos_y), img_with_border)
            print(itr)
            background.save(("{0}"+str(itr)+".png").format("./media/image"))
            itr += 1

        fs = FileSystemStorage()
        fs.save(uploaded_image.name, uploaded_image)   
  
    return render(request, 'uploadpage.html')

def upload(request):
    return render(request, 'uploadpage.html')

def index(request):
    return render(render, 'rootpage2.html')