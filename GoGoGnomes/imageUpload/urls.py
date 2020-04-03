from django.urls import path

from . import views

urlpatterns = [
    path('', views.imageUpload, name='imageUpload'),
    path('upload/', views.upload, name='upload'),
    path('', views.index , name='index'),
]