from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def index2(request):
   #return HttpResponse("Hello, Welcome to the ROOT page of the Go Go Gnomes!")
   return render(request, 'rootpage.html')