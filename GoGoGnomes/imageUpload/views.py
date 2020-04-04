from django.shortcuts import render
from PIL import Image, ImageOps
import io, os

from .models import Samplecards, Holidays

# Main view for handling image upload and selection POSTs
def imageUpload(request):
    if request.method == 'POST':
        selection = request.POST['selection']

        # Assign holiday id for database calls depending on which holiday is selected
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

        # itr is used for saving each new sample
        itr = 0

        os.system('rm ./media/*')

        # Iterate through all of the samples of the selected holiday
        for sample in Samplecards.objects.filter(holidayid=holiday_id):
            # Grab the image bytes
            theImage = io.BytesIO(sample.image)

            # Grab the user upload from POST request
            uploaded_image = request.FILES['img']   

            # Opens and formats user uploaded image using Pillow to be combined with sample background            
            foreground = Image.open(uploaded_image).convert("RGBA").resize((sample.resize_img_len, sample.resize_img_wid))
            
            # Adds a styling border on the uploaded image and rotates if necessary
            img_with_border = ImageOps.expand(foreground,border=10,fill=sample.border_color).rotate(sample.rotation, expand=True)
            
            # Opens, formats, combines, and saves the background image combined with the user uploaded image
            background = Image.open(theImage).convert("RGBA")
            background.paste(img_with_border, (sample.user_img_pos_x, sample.user_img_pos_y), img_with_border)
            background.save(("{0}"+str(itr)+".png").format("./media/image"))
            itr += 1

    # Returns back to the user upload page
    return render(request, 'imageUpload.html')

# Returns a render back to the upload page when using the nav bar
def upload(request):
    return render(request, 'uploadpage.html')

# Returns a render back to the homepage when using the nav bar
def index(request):
    return render(render, 'rootpage2.html')