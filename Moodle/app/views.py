from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect,get_object_or_404
from .models import Projet, FichierDeSoumission
from .forms import ProjetForm, FichierDeSoumissionForm


def projet_create(request):
    if (request.method == 'POST'):

        form = ProjetForm(request.POST, request.FILES)

        if (form.is_valid()):
            form.save()

            return redirect('PagesEnseignants/dashboard.html')

    else:
        form = ProjetForm()

    return render(request, 'app/createProjet.html', {'form': form})


def projet_liste(request):
    projet = Projet.objects.all()
    return render(request, 'PagesEtudiants/ListeCours.html', {'projet': projet})

def fichier_liste(request):
    s = FichierDeSoumission.objects.all()
    return render(request, 'PagesEnseignants/ListeSoumission.html', {'projet': s})


def fichier_create(request):
    if (request.method == 'POST'):

        form = FichierDeSoumissionForm(request.POST, request.FILES)

        if (form.is_valid()):
            form.save()

            return redirect('PagesEtudiants/dashboard.html')

    else:
        form = FichierDeSoumissionForm()

    return render(request, 'app/createSoumis.html', {'form': form})



# Create your views here.
def ListeCours(request):
    return render(request, 'ListeCours.html')

def ListeEnseignants(request):
    return render(request, 'ListeEnseignants.html')

def ListeEtudiants(request):
    return render(request, 'ListeEtudiants.html')