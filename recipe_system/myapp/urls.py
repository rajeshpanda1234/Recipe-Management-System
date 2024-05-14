from django.urls import path
from . import views



urlpatterns = [
    
    path('', views.home , name="home"),
    path('login', views.login , name="login"),
    path('logout', views.logged_out , name="logout"),
    path('add-recipe', views.add_recipe , name="add_recipe"),
    path('recipe/<str:category>', views.recipe , name="recipe"),
    path('recipe/<str:category>/<int:id>', views.recipe_details , name="recipe_details"),
    path('test/', views.test , name="test"),
    path('recipe/<str:category>/<int:id>/update-recipe', views.update_recipe, name='update_recipe') ,
    path('recipe/<str:category>/<int:id>/delete-recipe', views.delete_item, name='delete_item')
]