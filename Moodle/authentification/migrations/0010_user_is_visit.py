# Generated by Django 4.2.4 on 2023-08-27 11:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authentification', '0009_remove_student_date_remove_student_is_student_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='is_visit',
            field=models.BooleanField(default=True),
        ),
    ]