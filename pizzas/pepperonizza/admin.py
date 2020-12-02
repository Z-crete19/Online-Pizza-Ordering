from django.contrib import admin, messages
from django.utils.translation import ngettext
from django.contrib.auth import get_permission_codename
from .models import PizzaModel, BurgerModel, PastaModel, SoftDrinks, CustomerModel, OrderModel, OrderedItem, PayModel, Feedback
# Register your models here.

class OrderItemInline(admin.TabularInline):
    model = OrderModel

class ItemAdmin(admin.ModelAdmin):
    inlines = [OrderItemInline]

class OrderAdmin(admin.ModelAdmin):
    
    list_display = ['username', 'email', 'address', 'item', 'paid', 'status']
    ordering = ['username']
    actions = ['mark_complete', 'mark_cancel']

    def mark_complete(self, request, queryset):
        updated = queryset.update(status = 'a')
        self.message_user(request, ngettext(
            '%d Order was successfully marked as Complete.',
            '%d Order were successfully marked as Complete.',
            updated,
        ) % updated, messages.SUCCESS)

    mark_complete.short_description = "Mark Selected Order as Complete"
    mark_complete.allowed_permissions = ('accepted',)

    def has_accepted_permission(self, request):
        """Does the user have permission to accept ?"""
        opts = self.opts
        codename = get_permission_codename('accepted', opts)
        return request.user.has_perm('%s %s' % (opts.app_label, codename))

    def mark_cancel(self, request, queryset):
        updated = queryset.update(status = 'd')
        self.message_user(request, ngettext(
            '%d Order was successfully marked as Cancel.',
            '%d Order were successfully marked as Cancel.',
            updated,
        ) % updated, messages.SUCCESS)

    mark_cancel.short_description = "Mark Selected Order as Cancel"
    mark_cancel.allowed_permissions = ('decline',)

    def has_decline_permission(self, request):
        """Does the user have permission to Cancel ?"""
        opts = self.opts
        codename = get_permission_codename('decline', opts)
        return request.user.has_perm('%s %s' % (opts.app_label, codename))

class QueryAdmin(admin.ModelAdmin):

    list_display = ['username', 'full_name', 'email', 'subject', 'message']
    ordering = ['full_name']



admin.site.register(PizzaModel)
admin.site.register(BurgerModel)
admin.site.register(PastaModel)
admin.site.register(SoftDrinks)
admin.site.register(CustomerModel)
admin.site.register(OrderModel, OrderAdmin)
admin.site.register(OrderedItem, ItemAdmin)
admin.site.register(PayModel)
admin.site.register(Feedback, QueryAdmin)
