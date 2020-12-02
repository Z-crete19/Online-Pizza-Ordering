# Generated by Django 3.0.7 on 2020-09-14 06:37

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='BurgerModel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('img', models.ImageField(upload_to='pics')),
                ('desc', models.TextField()),
                ('category', models.CharField(max_length=30)),
                ('price', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='CustomerModel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('userid', models.IntegerField()),
                ('profile_pic', models.ImageField(upload_to='pics')),
                ('phoneno', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='OrderedItem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('img', models.ImageField(upload_to='pics')),
                ('quantity', models.CharField(max_length=20)),
                ('category', models.CharField(max_length=30)),
                ('price', models.IntegerField()),
                ('total_price', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='PastaModel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('img', models.ImageField(upload_to='pics')),
                ('desc', models.TextField()),
                ('category', models.CharField(max_length=30)),
                ('price', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='PayModel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('payid', models.IntegerField()),
                ('username', models.CharField(max_length=150)),
                ('owner', models.CharField(max_length=150)),
                ('cardnumber', models.CharField(max_length=50)),
                ('month', models.CharField(max_length=20)),
                ('year', models.CharField(max_length=20)),
                ('cvv', models.CharField(max_length=130)),
            ],
        ),
        migrations.CreateModel(
            name='PizzaModel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('img', models.ImageField(upload_to='pics')),
                ('desc', models.TextField()),
                ('category', models.CharField(max_length=30)),
                ('price', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='SoftDrinks',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('img', models.ImageField(upload_to='pics')),
                ('desc', models.TextField()),
                ('category', models.CharField(max_length=30)),
                ('price', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='OrderModel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=150)),
                ('email', models.EmailField(max_length=254)),
                ('phoneno', models.CharField(max_length=20)),
                ('address', models.TextField()),
                ('timestamp', models.DateTimeField(auto_now=True, null=True)),
                ('status', models.CharField(choices=[('p', 'pending'), ('a', 'Accepted'), ('d', 'Decline')], max_length=20)),
                ('paid', models.BooleanField(default=False)),
                ('item', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='pepperonizza.OrderedItem')),
            ],
        ),
    ]