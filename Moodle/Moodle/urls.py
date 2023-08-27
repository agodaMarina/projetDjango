"""
URL configuration for Moodle project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls.static import static
from django.conf import settings
import authentification.views
import app.views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/', authentification.views.connexion, name='login'),
    path('accens/', authentification.views.es, name='en'),
    path('accet/', authentification.views.et, name='ets'),
    path('', authentification.views.signup_page, name='signup'),
    path('etudiant/create/', authentification.views.CreateEtudiant, name='New_etudiant'),
    path('etudiant/liste/', authentification.views.readEtudiant, name='liste_etudiant'),
    path('etudiant/<int:id>/update/', authentification.views.updateEtudiant, name='updateEtudiant'),
    path('etudiant/<int:id>/delete/', authentification.views.deleteEtudiant, name='deleteEtudiant'),
    path('enseignant/create/', authentification.views.CreateEnseignant, name='New_enseignant'),
    path('enseignant/liste/', authentification.views.ReadEnseignant, name='liste_enseignant'),
    path('enseignant/update/', authentification.views.updateEnseignant, name='updateEnseignant'),
    path('enseignant/delete/<int:id>/', authentification.views.deleteEnseignant, name='deleteEnseignant'),
    path('logout/', authentification.views.Deconnxion, name='logout'),
    path('acceuil/', authentification.views.acceuil, name='home'),
]

# gestion des images
if settings.DEBUG:
    urlpatterns += static(
        settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)