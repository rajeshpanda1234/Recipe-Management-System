from django.db import models
from django.contrib.auth.models import User
import uuid


class Basemodel(models.Model):
    uid = models.UUIDField(primary_key=True, editable=False,default=uuid.uuid4)
    created_at = models.DateTimeField(auto_now= True)
    updated_at = models.DateTimeField(auto_now_add= True)
    

    class Meta:
        abstract = True

class UserProfile(Basemodel):
    user = models.OneToOneField(User, on_delete=models.CASCADE , related_name="profile")
    def __str__(self):
        return self.user.first_name + " " +self.user.last_name

class Category(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self) -> str:
        return self.name

class Recipe(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    ingredients = models.TextField()
    instructions = models.TextField()
    category = models.ForeignKey(Category, on_delete=models.SET_NULL, null=True)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now=True)
    image = models.ImageField(upload_to='media/recipe_images')

    def __str__(self) -> str:
        return self.title

class Feedback(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    recipe = models.ForeignKey(Recipe, on_delete=models.CASCADE)
    rating = models.IntegerField()
    message = models.TextField()
    def __str__(self) -> str:
        return self.user.first_name or "No name" 