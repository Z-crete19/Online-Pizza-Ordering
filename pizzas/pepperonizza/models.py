from django.db import models
from django.contrib.auth.models import User
# Create your models here.

STATUS_CHOICES = [
    ('p', 'pending'),
    ('a', 'Accepted'),
    ('d', 'Decline')
]

class PizzaModel(models.Model):
    
    name = models.CharField(max_length = 50)
    img = models.ImageField(upload_to='pics')
    desc = models.TextField()
    category = models.CharField(max_length = 30)
    price = models.IntegerField()

    def __str__(self):
        return self.name


class BurgerModel(models.Model):
    
    name = models.CharField(max_length = 50)
    img = models.ImageField(upload_to='pics')
    desc = models.TextField()
    category = models.CharField(max_length = 30)
    price = models.IntegerField()

    def __str__(self):
        return self.name


class PastaModel(models.Model):
    
    name = models.CharField(max_length = 50)
    img = models.ImageField(upload_to='pics')
    desc = models.TextField()
    category = models.CharField(max_length = 30)
    price = models.IntegerField()

    def __str__(self):
        return self.name


class SoftDrinks(models.Model):

    name = models.CharField(max_length = 50)
    img = models.ImageField(upload_to='pics')
    desc = models.TextField()
    category = models.CharField(max_length = 30)
    price = models.IntegerField()

    def __str__(self):
        return self.name
    

class CustomerModel(models.Model):
    
    userid = models.IntegerField()
    profile_pic = models.ImageField(upload_to='pics', default='pics/None/profile.jpg')
    phoneno = models.CharField(max_length = 20)
    username = models.CharField(max_length = 150)

    def __str__(self):
        return self.username

class OrderedItem(models.Model):
    
    name = models.CharField(max_length = 50)
    img = models.ImageField(upload_to='pics')
    quantity = models.CharField(max_length = 20)
    category = models.CharField(max_length = 30)
    price = models.IntegerField()
    total_price = models.IntegerField()

    def __str__(self):
        return '%s of Category %s' % (self.name, self.category)


class OrderModel(models.Model):
    
    username = models.CharField(max_length = 150)
    email = models.EmailField(max_length = 254)
    phoneno = models.CharField(max_length = 20)
    address = models.TextField()
    timestamp = models.DateTimeField(auto_now = True, null = True)
    status = models.CharField(max_length = 50, choices = STATUS_CHOICES)
    paid = models.BooleanField(default = False)
    item = models.ForeignKey(OrderedItem, on_delete = models.CASCADE, null = True)



class PayModel(models.Model):
    
    payid = models.IntegerField()
    username = models.CharField(max_length = 150)
    owner = models.CharField(max_length = 150)
    cardnumber = models.CharField(max_length = 50)
    month = models.CharField(max_length = 20)
    year = models.CharField(max_length = 20)
    cvv = models.CharField(max_length = 130)

    def __str__(self):
        return 'Paid by %s' % (self.username)


class Feedback(models.Model):

    username = models.CharField(max_length = 150)
    full_name = models.CharField(max_length = 200)
    email = models.EmailField(max_length = 254)
    subject = models.TextField()
    message = models.TextField()

    def __str__(self):
        return self.full_name


