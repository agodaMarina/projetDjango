from django import forms
from .models import FichierDeSoumission, Cours, Projet
from authentification.models import Student, Teacher, User
class FichierDeSoumissionForm(forms.ModelForm):
    class Meta:
        model = FichierDeSoumission
        fields=('libelle', 'fichier')
    libelle = forms.CharField(
        max_length=30,
        widget=forms.TextInput(
            attrs={
                'type': 'text',
                'class': 'form-control',
                
            }
        ),
    )
    fichier = forms.CharField(
        
        widget=forms.TextInput(
            attrs={
                'type': 'file',
                'class': 'form-control',
            }
        ),
    )
    
            


class ProjetForm(forms.ModelForm):
    class Meta:
        model= Projet
        fields = ('intitule', 'fichier', 'statut')
    intitule = forms.CharField(
        max_length=30,
        widget=forms.TextInput(
            attrs={
                'type': 'text',
                'class': 'form-control',
                
            }
        ),
    )
    fichier = forms.CharField(
        
        widget=forms.TextInput(
            attrs={
                'type': 'file',
                'class': 'form-control',
            }
        ),
    )
    statut = forms.ChoiceField(
        
        widget=forms.TextInput(
            attrs={
               
                'class': 'form-control',
            }
        ),
    )
        
    