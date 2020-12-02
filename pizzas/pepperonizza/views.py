from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth.models import User, auth
from django.contrib import messages
from django.contrib.auth.hashers import make_password
from django.http import Http404, HttpResponse
from .forms import ImageUploadForm
from .filters import OrderFilter, AdminFilter
from win10toast import ToastNotifier
from django.conf import settings
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.utils.html import strip_tags
import random
from .models import PizzaModel, PastaModel, BurgerModel, SoftDrinks, CustomerModel, OrderModel, OrderedItem, PayModel, Feedback
# Create your views here.


# Signup
def register(request):
    if request.method == 'POST':
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        username = request.POST['username']
        password1 = request.POST['password1']
        password2 = request.POST['password2']
        email = request.POST['email']
        phoneno =request.POST['phoneno']
        form = ImageUploadForm(request.POST, request.FILES)
        if form.is_valid():
            profile_pic = form.cleaned_data['profile_pic']

        if password1==password2:
            if User.objects.filter(username=username).exists():
                messages.info(request,'Username already exists')
                return redirect('register')
            elif User.objects.filter(email=email).exists():
                messages.info(request,'E-mail already taken')
                return redirect('register')
            else:
                user=User.objects.create_user(username=username, password=password1, email=email, first_name=first_name, last_name=last_name)
                user.save();
                lastobject = len(User.objects.all())-1
                CustomerModel(userid = User.objects.all()[int(lastobject)].id, phoneno=phoneno, profile_pic=profile_pic, username=username).save()

                #mail
                subject = 'Register Successful!!'
                message = f'Hi {user.first_name}, Thank you for signing up for Pepperonizza Delicious and completing your account set up. You are all set.'
                email_from = settings.EMAIL_HOST_USER
                recipient_list = [user.email, ]
                send_mail(subject, message, email_from, recipient_list)

                #Notification Win10
                notif = ToastNotifier()
                notif.show_toast('Registered', 'Login Now!', icon_path="static/image/pizza.ico", duration = 10)
                return redirect('login')

        else:
            messages.info(request, 'Password not matching....')
            return redirect('register')

    else:
        #form = Customer()
        return render(request, "register.html")

# Sign in
def login(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        user = auth.authenticate(username=username, password=password)

        if user is not None:
            auth.login(request, user)

            #Notification Win10
            notif = ToastNotifier()
            notif.show_toast('Successfully Logged In', 'Welcome to Pepperonizza Delicious', icon_path="static/image/pizza.ico", duration = 10)
            return redirect("/")
        else:
            messages.info(request, 'Invalid Username or Password!!!')
            return redirect('login')

    else:
        return render(request, 'login.html')    

# Logout
def logout(request):
    auth.logout(request)
    #Notification Win10
    notif = ToastNotifier()
    notif.show_toast('Successfully Logged Out', 'Come back Again', icon_path="static/image/pizza.ico", duration = 10)
    return redirect('/')

# Homepage
def index(request):
    pizzas = PizzaModel.objects.all()
    if request.user.is_authenticated:
        if request.user.is_superuser:
            context = {'pizzas': pizzas}
        else:
            customer = CustomerModel.objects.filter(username = request.user.username)[0]
            context = {'pizzas': pizzas, 'customer': customer}
    else:
        context = {'pizzas': pizzas}
    return render(request, "index.html", context)

# About
def about(request):
    if request.user.is_authenticated:
        if request.user.is_superuser:
            return render(request, "about.html")
        else:
            customer = CustomerModel.objects.filter(username = request.user.username)[0]
            context = {'customer': customer}
            return render(request, "about.html", context)
    else:
        return render(request, "about.html")

# Contact
def contact(request):
    if request.user.is_authenticated:
        if request.user.is_superuser:
            return render(request, "contact.html")
        else:
            if request.method == 'POST':
                full_name = request.POST['full_name']
                email = request.POST['email']
                subject = request.POST['subject']
                message = request.POST['message']
                username = request.user.username

                Feedback(username=username, full_name=full_name, email=email, subject=subject, message=message).save()
                return redirect('contact')

            else:
                customer = CustomerModel.objects.filter(username = request.user.username)[0]
                context = {'customer': customer}
                return render(request, "contact.html", context)
    else:
        if request.method == 'POST':
            full_name = request.POST['full_name']
            email = request.POST['email']
            subject = request.POST['subject']
            message = request.POST['message']
            username = "anonymous"

            Feedback(username=username, full_name=full_name, email=email, subject=subject, message=message).save()
            return redirect('contact')

        else:
            return render(request, "contact.html")

# Blog
def blog(request):
    if request.user.is_authenticated:
        if request.user.is_superuser:
            return render(request, "blog.html")
        else:
            customer = CustomerModel.objects.filter(username = request.user.username)[0]
            context = {'customer': customer}
            return render(request, "blog.html", context)
    else:
        return render(request, "blog.html")

# Blog2
def blog_single(request):
    if request.user.is_authenticated:
        if request.user.is_superuser:
            return render(request, "blog-single.html")
        else:
            customer = CustomerModel.objects.filter(username = request.user.username)[0]
            context = {'customer': customer}
            return render(request, "blog-single.html", context)
    else:
        return render(request, "blog-single.html")

# Privacy
def privacy(request):
    if request.user.is_authenticated:
        if request.user.is_superuser:
            return render(request, "privacy.html")
        else:
            customer = CustomerModel.objects.filter(username = request.user.username)[0]
            context = {'customer': customer}
            return render(request, "privacy.html", context)
    else:
        return render(request, "privacy.html")

#Terms & Co
def terms(request):
    if request.user.is_authenticated:
        if request.user.is_superuser:
            return render(request, "terms.html")
        else:
            customer = CustomerModel.objects.filter(username = request.user.username)[0]
            context = {'customer': customer}
            return render(request, "terms.html", context)
    else:
        return render(request, "terms.html")

#FAQ
def faq(request):
    if request.user.is_authenticated:
        if request.user.is_superuser:
            return render(request, "faq.html")
        else:
            customer = CustomerModel.objects.filter(username = request.user.username)[0]
            context = {'customer': customer}
            return render(request, "faq.html", context)
    else:
        return render(request, "faq.html")

# Menu
@login_required(redirect_field_name='login')
def viewmenu(request):
    pizzas = PizzaModel.objects.all()
    pastas = PastaModel.objects.all()
    burgers = BurgerModel.objects.all()
    drinks = SoftDrinks.objects.all()
    if request.user.is_authenticated:
        if request.user.is_superuser:
            context = {
                'pizzas': pizzas,
                'pastas': pastas,
                'burgers': burgers,
                'drinks': drinks
            }
        else:
            customer = CustomerModel.objects.filter(username = request.user.username)[0]
            context = {
                'pizzas': pizzas,
                'pastas': pastas,
                'burgers': burgers,
                'drinks': drinks,
                'customer': customer
            }
    else:
        context = {
            'pizzas': pizzas,
            'pastas': pastas,
            'burgers': burgers,
            'drinks': drinks
        }
    return render(request, "menu.html", context)

# Cart
@login_required(redirect_field_name='login')
def cart(request, cat, foodpk):
    if request.user.is_superuser:
        return HttpResponse("<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><center><h1>*** Please use a different normal User Account. ***</h1></center>")
    else:
        # If chooses any Pizza
        for pizza in PizzaModel.objects.all():
            if pizza.category == cat:
                foods = PizzaModel.objects.filter(id = foodpk)[0]
                context = {'foods': foods}
                return render(request, "cart.html", context)
        # If chooses any Pasta
        for pasta in PastaModel.objects.all():
            if pasta.category == cat:
                foods = PastaModel.objects.filter(id = foodpk)[0]
                context = {'foods': foods}
                return render(request, "cart.html", context)
        # If chooses any Burger
        for burger in BurgerModel.objects.all():
            if burger.category == cat:
                foods = BurgerModel.objects.filter(id = foodpk)[0]
                context = {'foods': foods}
                return render(request, "cart.html", context)
        # If chooses any Drinks
        for drink in SoftDrinks.objects.all():
            if drink.category == cat:
                foods = SoftDrinks.objects.filter(id = foodpk)[0]
                context = {'foods': foods}
                return render(request, "cart.html", context)

#Order placed
@login_required(redirect_field_name='login')
def placeorder(request, cat, foodpk):
    
    username = request.user.username
    email = request.user.email
    phoneno = CustomerModel.objects.filter(userid = request.user.id)[0].phoneno
    address = request.POST['address']
    status = 'p'
    total_price = 0

    # If user buys Pizza
    pizza = PizzaModel.objects.filter(id = foodpk)[0]
    if pizza.category == cat:
        pizzaid = pizza.id
        name = pizza.name
        price = pizza.price
        img = pizza.img
        category = pizza.category
        quantity = request.POST.get(str(pizzaid), " ")
        if str(quantity) != "0" and str(quantity) != " ":
            total_price = total_price + (int(quantity) * price)

        item = OrderedItem(name = name, img = img, quantity = quantity, category = category, price = price, total_price = total_price)
        item.save()
        OrderModel(username = username, email = email, phoneno = phoneno, address = address, status =status, item = item).save()
        #lastobject = len(OrderModel.objects.all())-1
        #OrderedItem(orderid = order, name = name, img = img, quantity = quantity, category = category, price = price, total_price = total_price).save()
        return redirect("checkout")

    # If user buys Burger
    burger = BurgerModel.objects.filter(id = foodpk)[0]
    if burger.category == cat:
        burgerid = burger.id
        name = burger.name
        price = burger.price
        img = burger.img
        category = burger.category
        quantity = request.POST.get(str(burgerid), " ")
        if str(quantity) != "0" and str(quantity) != " ":
            total_price = total_price + (int(quantity) * price)

        item = OrderedItem(name = name, img = img, quantity = quantity, category = category, price = price, total_price = total_price)
        item.save()
        OrderModel(username = username, email = email, phoneno = phoneno, address = address, status =status, item = item).save()
        #lastobject = len(OrderModel.objects.all())-1
        #OrderedItem(orderid = order, name = name, img = img, quantity = quantity, category = category, price = price, total_price = total_price).save()
        return redirect("checkout")

    # If user buys Pasta
    pasta = PastaModel.objects.filter(id = foodpk)[0]
    if pasta.category == cat:
        pastaid = pasta.id
        name = pasta.name
        price = pasta.price
        img = pasta.img
        category = pasta.category
        quantity = request.POST.get(str(pastaid), " ")
        if str(quantity) != "0" and str(quantity) != " ":
            total_price = total_price + (int(quantity) * price)

        item = OrderedItem(name = name, img = img, quantity = quantity, category = category, price = price, total_price = total_price)
        item.save()
        order = OrderModel(username = username, email = email, phoneno = phoneno, address = address, status =status, item = item).save()
        #lastobject = len(OrderModel.objects.all())-1
        #OrderedItem(orderid = order, name = name, img = img, quantity = quantity, category = category, price = price, total_price = total_price).save()
        return redirect("checkout")

    # If user buys Drinks
    drink = SoftDrinks.objects.filter(id = foodpk)[0]
    if drink.category == cat:
        drinkid = drink.id
        name = drink.name
        price = drink.price
        img = drink.img
        category = drink.category
        quantity = request.POST.get(str(drinkid), " ")
        if str(quantity) != "0" and str(quantity) != " ":
            total_price = total_price + (int(quantity) * price)

        item = OrderedItem(name = name, img = img, quantity = quantity, category = category, price = price, total_price = total_price)
        item.save()
        order = OrderModel(username = username, email = email, phoneno = phoneno, address = address, status =status, item = item).save()
        #lastobject = len(OrderModel.objects.all())-1
        #OrderedItem(orderid = order, name = name, img = img, quantity = quantity, category = category, price = price, total_price = total_price).save()
        return redirect("checkout")

# Checkout
@login_required(redirect_field_name='login')
def checkout(request):
    orders = OrderModel.objects.filter(username = request.user.username, paid = False, status = 'p')
    #orderid = order.id
    #items = OrderedItem.objects.get(orderid = order)
    customer = CustomerModel.objects.filter(username = request.user.username)[0]
    for order in orders:
        context = {
            'order': order,
            'customer': customer
        }
    return render(request, "checkout.html", context)

#Payment
@login_required(redirect_field_name='login')
def charge(request):
    
    username = request.user.username
    owner = request.POST['owner']
    cardnumber = request.POST['cardnumber']
    month = request.POST['month']
    year = request.POST['year']
    cvv = make_password(request.POST['cvv'])

    lastobject = len(OrderModel.objects.all())-1
    PayModel(payid = OrderModel.objects.all()[int(lastobject)].id, username = username, owner = owner, cardnumber = cardnumber, month = month, year= year, cvv = cvv).save()

    id = request.POST['orderid']
    order = OrderModel.objects.filter(id = int(id))[0]
    order.paid = True
    order.save()
    return redirect("successful")

# On Completion
@login_required(redirect_field_name='login')
def success(request):
    
    user = request.user
    username = request.user.username
    #timestamp = datetime.now().date()
    orders = OrderModel.objects.filter(username = username, paid = True)
    customer = CustomerModel.objects.filter(username = username)[0]
    #lastobject = len(orders)-1
    for order in orders:
    #order = OrderModel.objects.get(id = item)
        context = {
            'user': user,
            'order': order,
            'customer': customer
        }

    #email
    My_list = []
    start, end = 0, 200
    if start < end:
        My_list.extend(range(start, end))
        My_list.append(end)
    num = random.choice(My_list)
    subject = 'Your Food Order Receipt #PPEDLECF'+str(num)
    html_message = render_to_string('email_thanks.html', context)
    plain_message = strip_tags(html_message)
    email_from = settings.EMAIL_HOST_USER
    recipient_list = [user.email, ]
    send_mail(subject, plain_message, email_from, recipient_list, html_message=html_message)

    #Notification Win10
    notif = ToastNotifier()
    notif.show_toast('Thank You', 'Thanks for using our system. We hope to see you again.', icon_path="static/image/pizza.ico", duration = 10)
    return render(request, "thanks.html", context)

# View Orders
@login_required(redirect_field_name='login')
def user_orders(request):
    
    orders = OrderModel.objects.filter(username = request.user.username)
    tableFilter = OrderFilter(request.GET, queryset = orders)
    orders = tableFilter.qs
    if request.user.is_superuser:
        context = {
                'orders': orders,
                'tableFilter': tableFilter
        }
    else:
        customer = CustomerModel.objects.filter(username = request.user.username)[0]
        context = {
                'orders': orders,
                'customer': customer,
                'tableFilter': tableFilter
        }
    return render(request, "myorders.html", context)


@login_required(redirect_field_name='login')
def cancel_order(request, orderpk):

    order = OrderModel.objects.filter(id = orderpk)[0]
    order.status = 'You cancelled the order'
    order.save()
    messages.info(request, 'Order Successfully cancelled. Your money has been refunded.')
    return redirect(request.META['HTTP_REFERER'])


""" Superuser Related """

@login_required(redirect_field_name='login')
def orders_view(request):
    """
        View placed orders from all customers. Superuser-use-only.
        Superuser can mark orders as completed or decline them.
    """
    if request.user.is_superuser:
        orders = OrderModel.objects.all()
        tableFilter = AdminFilter(request.GET, queryset = orders)
        orders = tableFilter.qs
        context = {
            'orders': orders,
            'tableFilter': tableFilter
        }
        return render(request, "allorders.html", context)
    else:
        #raise Http404("<br><br><br><br><center><h2>*** You are not authorized to view this page. ***</h2></center>")
        return HttpResponse("<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><center><h1>*** You are not authorized to view this page. ***</h1></center>")


@user_passes_test(lambda u: u.is_superuser)
def complete_order(request, orderpk):

    """ 
        Superuser marks an order as completed.
    """

    order = OrderModel.objects.filter(id = orderpk)[0]
    order.status = 'a'
    order.save()
    return redirect(request.META['HTTP_REFERER'])

@user_passes_test(lambda u: u.is_superuser)
def decline_order(request, orderpk):

    """ 
        Superuser cancels an order.
    """

    order = OrderModel.objects.filter(id = orderpk)[0]
    order.status = 'd'
    order.save()
    return redirect(request.META['HTTP_REFERER'])


#def mail(request):
 #   return render(request, "email_thanks.html")