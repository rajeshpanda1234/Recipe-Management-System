from django.db.models.signals import post_migrate , post_save
from django.contrib.auth.models import User
from .models import UserProfile
from django.dispatch import receiver
from django.apps import AppConfig
from .models import Category

@receiver(post_migrate)
def create_default_categories(sender, **kwargs):
    # Check if the Category model exists
    if Category.objects.all().count == 2:
        return
    
    # Create default categories
    Category.objects.update_or_create(name='Veg')
    Category.objects.update_or_create(name='Non-Veg')

    print('veg and non-veg category is created...')


@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    UserProfile.objects.update_or_create(user=instance)