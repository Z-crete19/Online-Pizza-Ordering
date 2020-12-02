import django_filters
from django_filters import DateFilter, CharFilter
from .models import PizzaModel, PastaModel, BurgerModel, SoftDrinks, CustomerModel, OrderModel, OrderedItem, PayModel

class OrderFilter(django_filters.FilterSet):

    #start_date = DateFilter(field_name = "timestamp", lookup_expr = 'gte')
    #end_date = DateFilter(field_name = "timestamp", lookup_expr = 'lte')

    class Meta:
        model = OrderModel
        fields = '__all__'
        exclude = ['username','email', 'phoneno', 'address', 'timestamp']

class AdminFilter(django_filters.FilterSet):

    #start_date = DateFilter(field_name = "timestamp", lookup_expr = 'gte')
    #end_date = DateFilter(field_name = "timestamp", lookup_expr = 'lte')
    user_name = CharFilter(field_name = "username", lookup_expr = 'icontains')

    class Meta:
        model = OrderModel
        fields = '__all__'
        exclude = ['username','email', 'phoneno', 'address', 'timestamp']