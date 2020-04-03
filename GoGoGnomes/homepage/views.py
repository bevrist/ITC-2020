from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def index(request):
    #return HttpResponse("Hello, Welcome to the home page of the Go Go Gnomes!")
    return render(request, "rootpage2.html")