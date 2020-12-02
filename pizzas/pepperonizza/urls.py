from django.urls import path
from . import views
from django_filters.views import FilterView
from .models import OrderModel
from django.conf.urls import url

urlpatterns = [
    path('', views.index, name="index"),
    path('about/', views.about),
    path('contact/', views.contact, name="contact"),
    path('blog/', views.blog),
    path('blog_single/', views.blog_single),
    path('privacy/', views.privacy),
    path('terms/', views.terms),
    path('faq/', views.faq),
    path('signup/new_user/', views.register, name="register"),
    path('accounts/login/', views.login, name="login"),
    path('logout/', views.logout),
    path('menu/', views.viewmenu, name="menu"),
    path('cart/<str:cat>/<int:foodpk>/', views.cart, name="cart"),
    path('placeorder/<str:cat>/<int:foodpk>/', views.placeorder),
    path('cart/checkout/', views.checkout, name = "checkout"),
    path('payment/', views.charge),
    path('cart/checkout/successful/', views.success, name = "successful"),
    path('myorders/', views.user_orders),
    path('cancelorder/<int:orderpk>/', views.cancel_order),
    #Superusers
    path('orders/', views.orders_view),
    path('acceptorder/<int:orderpk>/', views.complete_order),
    path('declineorder/<int:orderpk>/', views.decline_order),
    #path('mail/', views.mail),
    
]