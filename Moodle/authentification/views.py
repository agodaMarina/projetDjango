from django.conf import settings
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect,get_object_or_404
from authentification import forms
from django.contrib.auth import login, authenticate, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from authentification.models import User, Student,Teacher
from app.models import Cours, Projet, FichierDeSoumission
from authentification.forms import EnseignantForm, EtudiantForm,ProfileUpdateForm

# fonction création d'enseignant

def CreateEnseignant(request):
    if request.method == "POST":
        form = EnseignantForm(request.POST)
        first_name = request.POST.get("first_name")
        last_name = request.POST.get("last_name")
        if form.is_valid():
            form.save()
            messages.success(
                request,
                "Un Compte Pour " + first_name + " " + last_name + " Vient d'être créé.",
            )
            return redirect("liste_enseignant")
        else:
            messages.error(request, "Veuillez corriger Les erreurs !.")
    else:
        form = EnseignantForm()

    return render(
        request,
        "PagesAdmin/createEnseignants.html",
        {"title": "Ajout d'enseignant | DjangoSMS", "form": form},
    )

#liste des enseignants

def ReadEnseignant(request):
    enseignants=Teacher.objects.all()
    return render(request, 'pagesAdmin/ListeEnseignants.html', {'enseignants':enseignants})

def deleteEnseignant(request,id):
    teacher = Teacher.objects.get(id=id)
    if request.method == 'POST':
        teacher.delete()
        messages.success(request, "L'enseignant a bien été supprimé .")
        return redirect("liste_enseignant")
    return render(request, 'pagesAdmin/deleteEnseignant.html')


# fonction création d'etudiant
@login_required
def CreateEtudiant(request):
    if request.method == "POST":
        form = EtudiantForm(request.POST)
        first_name = request.POST.get("first_name")
        last_name = request.POST.get("last_name")
        if form.is_valid():
            form.save()
            messages.success(
                request,
                "Un Compte Pour " + first_name + " " + last_name + " Vient d'être créé.",
            )
            return redirect("liste_etudiant")
        else:
            messages.error(request, "Veuillez corriger Les erreurs !.")
    else:
        form = EtudiantForm()

    return render(
        request,
        "PagesAdmin/createEtudiants.html",
        {"title": "Ajout d'etudiant ", "form": form},)
@login_required
def readEtudiant(request):
    etudiants=Student.objects.all()
    return render(request, 'pagesAdmin/ListeEtudiants.html', {'etudiants':etudiants})
@login_required
def deleteEtudiant(request,id):
    etudiant = Student.objects.get(id=id)
    if request.method == 'POST':
        etudiant.delete()
        messages.success(request, "L'étudiant a été bien sélectionné.")
        return redirect("liste_etudiant")
    return render(request, 'pagesAdmin/deleteEtudiant.html')
    
    


# fonction de login
def connexion(request):
    form = forms.UserForm()
    message=''
    if request.method == 'POST':
        form = forms.UserForm(request.POST)
        if form.is_valid():
            user = authenticate(
                username=form.cleaned_data['username'],
                password=form.cleaned_data['password'],

            )
            if user is not None:
                login(request, user)
                message = f'Bonjour, {user.username}! Vous êtes connecté.'
                #vérification du rôle de l'utilisateur pour lr rediriger vers son dashboard
                # user=User.objects.get(pk=id)
                # ide=request.user.id
                if request.user.is_teacher:
                    return redirect('en')
                
                elif request.user.is_student:
                    # cours=user.CoursAlloue.all()
                    return redirect('ets')
                else:
                    return redirect('home')
            else:
                message = 'Identifiants invalides.'
    return render(
        request, 'authentification/connexion.html', context={'form': form, 'message': message})


#fonction de déconnexion 
def Deconnxion(request):
    logout(request)
    return redirect('login')


#fonction pour modification du profile
@login_required
def ModificationProfile(request):
    utilisateur = User.objects.get(id=id)

    if request.method == 'POST':
        form = forms.SignupForm(request.POST, instance=utilisateur)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('profile')
    else:
        form = forms.SignupForm(instance=utilisateur)

    return render(request,
                  'authentification/profile_update.html',
                  {'form': form})

#fonction acceuil
@login_required
def acceuil(request):
    return render(request, 'PagesAdmin/bienvenue.html')
def et(request):
    return render(request, 'PagesEtudiants/dashboard.html')
def es(request):
    return render(request, 'PagesEnseignants/dashboard.html')

@login_required
def updateEnseignant(request, id):
    instance = get_object_or_404(User, is_teacher=True, id=id)
    if request.method == "POST":
        form = ProfileUpdateForm(request.POST, request.FILES, instance=instance)
        full_name = instance.get_full_name
        if form.is_valid():
            form.save()
            messages.success(request, "L'enseignant " + full_name + " a bien été modifié.")
            return redirect("liste_enseignant")
        else:
            messages.error(request, "Please correct the error below.")
    else:
        form = ProfileUpdateForm(instance=instance)
    return render(
        request,
            "PagesAdmin/updateEs.html",
            {
                "title": "Modification",
                "form": form,
            },
  
      )
@login_required
def updateEtudiant(request, id):
    instance = get_object_or_404(User, is_student=True, id=id)
    if request.method == "POST":
        form = ProfileUpdateForm(request.POST, request.FILES, instance=instance)
        full_name = instance.get_full_name
        if form.is_valid():
            form.save()

            messages.success(request, "L'etudiant " + full_name + " a bien été modifié.")
            return redirect("liste_etudiant")
        else:
            messages.error(request, "Please correct the error below.")
    else:
        form = ProfileUpdateForm(instance=instance)
    return render(
        request,
            "PagesAdmin/updateEt.html",
            {
                "title": "Modification",
                "form": form,
            },
        )

def signup_page(request):
    form = forms.SignupForm()
    if request.method == 'POST':
        form = forms.SignupForm(request.POST)
       
        if form.is_valid():
            user = form.save()
            # auto-login user
            login(request, user)
            return redirect('home')
        else:
            print('attention')
    
    return render(request, 'authentification/signup.html', context={'form': form})