from django.db import models
from django.utils import timezone
from django.urls import reverse
from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    is_student=models.BooleanField(default=False)
    is_teacher=models.BooleanField(default=False)
    is_visit=models.BooleanField(default=True)
    date_de_naissance=models.DateField(verbose_name='Date de Naissance',default=timezone.now)
    email = models.EmailField(blank=True, null=True)
    
    @property
    def get_full_name(self):
        full_name = self.username
        if self.first_name and self.last_name:
            full_name = self.first_name + " " + self.last_name
        return full_name

    def __str__(self):
        return '{} ({})'.format(self.username, self.get_full_name)
    
    def get_absolute_url(self):
        return reverse('profile_single', kwargs={'id': self.id})

    @property
    def get_user_role(self):
        if self.is_student:
            return "etudiant"
        elif self.is_teacher:
            return "enseignant"
        elif self.is_visit:
            return "visiteur"
        
class Student(models.Model):
    student = models.OneToOneField(User, on_delete=models.CASCADE)
    number=models.IntegerField(verbose_name="Numero de l'étudiant")

    def __str__(self):
        return self.student.get_full_name

    def get_absolute_url(self):
        return reverse('profile_single', kwargs={'id': self.id})

    def delete(self, *args, **kwargs):
        self.student.delete()
        super().delete(*args, **kwargs)

class Teacher(models.Model):
    teacher = models.OneToOneField(User, on_delete=models.CASCADE)
    number=models.IntegerField(verbose_name="Numero de l'enseignant")

    def __str__(self):
        return self.teacher.get_full_name

    def get_absolute_url(self):
        return reverse('profile_single', kwargs={'id': self.id})

    def delete(self, *args, **kwargs):
        self.teacher.delete()
        super().delete(*args, **kwargs)