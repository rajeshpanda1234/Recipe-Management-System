from django.contrib import admin
from django.contrib.auth.models import User
from .models import UserProfile ,Recipe ,Feedback,Category


# Register your models here.


# admin.site.register(UserProfile)
# admin.site.register(Recipe)
# admin.site.register(Feedback)
admin.site.register(Category)

@admin.register(UserProfile)
class UserAdmin(admin.ModelAdmin):
    list_display = ('user_username','user_first_name', 'user_last_name', 'user_email', 'user_staffstatus')

    def user_username(self, obj):
        return obj.user.username
    user_username.short_description = 'Username'

    def user_first_name(self, obj):
        return obj.user.first_name
    user_first_name.short_description = 'First Name'

    def user_last_name(self, obj):
        return obj.user.last_name
    user_last_name.short_description = 'Last Name'

    def user_email(self, obj):
        return obj.user.email
    user_email.short_description = 'Email Address'

    def user_staffstatus(self, obj):
        return obj.user.is_staff
    user_staffstatus.short_description = 'Staff Status'


@admin.register(Recipe)
class RecipeDetails(admin.ModelAdmin):
    list_display = ('title','get_full_name','created_at')
    def get_full_name(self, obj):
        return f"{obj.created_by.first_name} {obj.created_by.last_name}"
    get_full_name.short_description = 'Full Name'

@admin.register(Feedback)
class FeedbackDeatils(admin.ModelAdmin):
    list_display = ('get_full_name','recipe','rating')
    def get_full_name(self, obj):
        return f"{obj.user.first_name} {obj.user.last_name}"
    get_full_name.short_description = 'Full Name'