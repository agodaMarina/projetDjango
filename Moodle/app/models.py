from django.db import models
from django.core.validators import FileExtensionValidator
from authentification.models import Student, Teacher
STATUT_CHOICES = (
    ("En Cours", "En Cours"),
    ("Soumis", "Soumis"),
    ("Corrigé", "Corrigé"),
    ("Traité", "Traité"),
    ("Archivé", "Archivé"),
)
# Create your models here.
class Cours(models.Model):
    libelle=models.CharField(max_length=3000)
    etudiants=models.ManyToManyField(Student, related_name='CoursAlloue')
    enseignant=models.ForeignKey(Teacher,on_delete=models.CASCADE)
    def __str__(self):
        return self.libelle

class Projet(models.Model):
    intitule = models.CharField(max_length=3000)
    fichier = models.FileField(upload_to='course_files/', validators=[FileExtensionValidator(['pdf', 'docx', 'doc', 'ppt', 'pptx', 'zip', 'rar', '7zip'])])
    statut = models.CharField(max_length=3000,choices=STATUT_CHOICES, default="En Cours")
    def __str__(self):
        return self.intitule
    def get_extension_short(self):
        ext = str(self.file).split(".")
        ext = ext[len(ext)-1]

        if ext == 'doc' or ext == 'docx':
            return 'word'
        elif ext == 'pdf':
            return 'pdf'
        elif ext == 'ppt' or ext == 'pptx':
            return 'powerpoint'
        elif ext == 'zip' or ext == 'rar' or ext == '7zip':
            return 'archive'

class FichierDeSoumission(models.Model):
    libelle=models.CharField(max_length=300)
    fichier=models.FileField(upload_to='course_files/', validators=[FileExtensionValidator(['pdf', 'docx', 'doc', 'ppt', 'pptx', 'zip', 'rar', '7zip'])])

    def get_extension_short(self):
        ext = str(self.fichier).split(".")
        ext = ext[len(ext)-1]

        if ext == 'doc' or ext == 'docx':
            return 'word'
        elif ext == 'pdf':
            return 'pdf'
        elif ext == 'ppt' or ext == 'pptx':
            return 'powerpoint'
        elif ext == 'zip' or ext == 'rar' or ext == '7zip':
            return 'archive'
        
    def delete(self, *args, **kwargs):
        self.fichier.delete()
        super().delete(*args, **kwargs)
        