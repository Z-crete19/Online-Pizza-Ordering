# Generated by Django 3.0.7 on 2020-10-24 05:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pepperonizza', '0003_auto_20201023_1241'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customermodel',
            name='profile_pic',
            field=models.ImageField(default='pics/None/profile.jpg', upload_to='pics'),
        ),
    ]
