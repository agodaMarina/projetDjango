from django import forms
from django.contrib.auth import get_user_model
from django.db import transaction
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from .models import Student, Teacher


class EnseignantForm(UserCreationForm):
    username = forms.CharField(
        max_length=30,
        widget=forms.TextInput(
            attrs={
                'type': 'text',
                'class': 'form-control',
                'id': 'username_id'
            }
        ),
    )
    number = forms.CharField(
        
        widget=forms.TextInput(
            attrs={
                'type': 'number',
                'class': 'form-control',
            }
        ),
    )
    
    first_name = forms.CharField(
        max_length=30,
        widget=forms.TextInput(
            attrs={
                'type': 'text',
                'class': 'form-control',
            }
        ),
       
    )

    last_name = forms.CharField(
        max_length=30,
        widget=forms.TextInput(
            attrs={
                'type': 'text',
                'class': 'form-control',
            }
        ),
       
    )
    email = forms.EmailField(
        widget=forms.TextInput(
            attrs={
                'type': 'email',
                'class': 'form-control',
            }
        ),
        label="Email Address",
    )

    password1 = forms.CharField(
        max_length=30, widget=forms.TextInput(attrs={'type': 'password', 'class': 'form-control', }),
       )

    password2 = forms.CharField(
        max_length=30, widget=forms.TextInput(attrs={'type': 'password', 'class': 'form-control', }),
         )

    
    class Meta(UserCreationForm.Meta):
        model = get_user_model()

    @transaction.atomic()
    def save(self):
        user = super().save(commit=False)
        user.is_teacher = True
        user.first_name = self.cleaned_data.get('first_name')
        user.last_name = self.cleaned_data.get('last_name')
        user.email = self.cleaned_data.get('email')
        user.save()
        teacher = Teacher.objects.create(
            teacher=user,
            number=self.cleaned_data.get('number'),
        )
        teacher.save()
        return user
    
class EtudiantForm(UserCreationForm):
    username = forms.CharField(
        max_length=30,
        widget=forms.TextInput(
            attrs={
                'type': 'text',
                'class': 'form-control',
                'id': 'username_id'
            }
        ),
    )
    number = forms.CharField(
        
        widget=forms.TextInput(
            attrs={
                'type': 'number',
                'class': 'form-control',
            }
        ),
    )
    
    first_name = forms.CharField(
        max_length=30,
        widget=forms.TextInput(
            attrs={
                'type': 'text',
                'class': 'form-control',
            }
        ),
       
    )

    last_name = forms.CharField(
        max_length=30,
        widget=forms.TextInput(
            attrs={
                'type': 'text',
                'class': 'form-control',
            }
        ),
       
    )
    email = forms.EmailField(
        widget=forms.TextInput(
            attrs={
                'type': 'email',
                'class': 'form-control',
            }
        ),
        label="Email Address",
    )

    password1 = forms.CharField(
        max_length=30, widget=forms.TextInput(attrs={'type': 'password', 'class': 'form-control', }),
       )

    password2 = forms.CharField(
        max_length=30, widget=forms.TextInput(attrs={'type': 'password', 'class': 'form-control', }),
         )

    
    class Meta(UserCreationForm.Meta):
        model = get_user_model()

    @transaction.atomic()
    def save(self):
        user = super().save(commit=False)
        user.is_student = True
        user.first_name = self.cleaned_data.get('first_name')
        user.last_name = self.cleaned_data.get('last_name')
        user.email = self.cleaned_data.get('email')
        user.save()
        student = Student.objects.create(
            student=user,
            number=self.cleaned_data.get('number'),
        )
        student.save()
        return user

class ProfileUpdateForm(UserChangeForm):
    email = forms.EmailField(
        widget=forms.TextInput(attrs={'type': 'email', 'class': 'form-control', }),
        label="Email Address", )

    first_name = forms.CharField(
        widget=forms.TextInput(attrs={'type': 'text', 'class': 'form-control', }),
        label="First Name", )

    last_name = forms.CharField(
        widget=forms.TextInput(attrs={'type': 'text', 'class': 'form-control', }),
        label="Last Name", )

    
    class Meta:
        model = get_user_model()
        fields = ['email', 'first_name', 'last_name']


class SignupForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        model = get_user_model()
    username = forms.CharField(
        max_length=30,
        widget=forms.TextInput(
            attrs={
                'type': 'text',
                'class': 'form-control',
                'id': 'username_id'
            }
        ),
    )
    first_name = forms.CharField(
        max_length=30,
        widget=forms.TextInput(
            attrs={
                'type': 'text',
                'class': 'form-control',
            }
        ),
       
    )

    last_name = forms.CharField(
        max_length=30,
        widget=forms.TextInput(
            attrs={
                'type': 'text',
                'class': 'form-control',
            }
        ),
       
    )
    email = forms.EmailField(
        widget=forms.TextInput(
            attrs={
                'type': 'email',
                'class': 'form-control',
            }
        ),
        
    )

    password1 = forms.CharField(
        max_length=30, widget=forms.TextInput(attrs={'type': 'password', 'class': 'form-control', }),
       )

    password2 = forms.CharField(
        max_length=30, widget=forms.TextInput(attrs={'type': 'password', 'class': 'form-control', }),
         )
    

class UserForm(forms.Form):
    username = forms.CharField(required=False,widget=forms.TextInput(attrs={'type': 'text', 'class': 'form-control', } ))

    password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control', }))
