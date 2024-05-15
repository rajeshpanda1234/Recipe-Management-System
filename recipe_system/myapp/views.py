from django.shortcuts import render ,HttpResponseRedirect ,redirect , HttpResponse
from django.http import JsonResponse
from django.contrib import messages
from django.contrib.auth.models import User
from django.contrib.auth import authenticate , login as auth_login, logout
from .models import UserProfile , Recipe ,Feedback , Category
from django.contrib.auth.decorators import login_required
from django.db.models import Q
import time
from django.urls import reverse



def home(request):
    # print(request.user.first_name)
    return render(request , 'index.html',{'loggedin':request.user.is_authenticated ,
                                          'fullname':request.user.first_name + ' ' +request.user.last_name if request.user.is_authenticated else ''})

def logged_out(request):
    logout(request)
    time.sleep(1)
    return redirect('/')  

def login(request):
    if request.user.is_authenticated:
        return redirect('/')
    if request.method == 'POST':
        form_type = request.POST.get('form_type')

        if form_type == "form1":
            first_name = request.POST.get('first_name')
            last_name = request.POST.get('last_name')
            email = request.POST.get('email')
            password = request.POST.get('password')
            confirm_password = request.POST.get('confirm_password')

            if password != confirm_password:
                messages.warning(request, 'Password mismatched')
                return HttpResponseRedirect('login')
            try:
                # Check if a user with the given email already exists
                user_obj = User.objects.get(username=email)
                messages.warning(request, 'Email already exists!')
                return HttpResponseRedirect('login')
            except User.DoesNotExist:
                # Create the user if it doesn't exist
                user_obj = User.objects.create(username=email, first_name=first_name, last_name=last_name, email=email)
                user_obj.set_password(password)
                user_obj.save()

                messages.success(request, 'User created successfully!')
                return redirect('login')  # Redirect to login page after successful user creation  # Redirect to login page after successful user creation
        elif form_type == "form2":
            email = request.POST.get('email')
            password = request.POST.get('password')

            user = authenticate(request, username=email, password=password)

            if user is not None:
                auth_login(request, user)
                time.sleep(2)
                # Redirect to the desired page after successful login
                return redirect(request.path)
            else:
                messages.warning(request, 'Account not found!...')
                return HttpResponseRedirect(request.path_info)

    time.sleep(1)
    return render(request, 'login.html')



def recipe(request , category):
    category_id = Category.objects.get(name = category)
    recipe_items = Recipe.objects.filter(category_id = category_id)
    print(recipe_items)
    return render(request , 'recipe.html', { 'loggedin':request.user.is_authenticated ,
                                            'recipe_items':recipe_items , 
                                            'category_id' : category ,
                                            'loggedin_user':request.user ,
                                            'fullname':request.user.first_name + ' ' +request.user.last_name if request.user.is_authenticated else ''})

@login_required
def recipe_details(request , category,id):
    category_id = Category.objects.get(name = category)
    all_feedback = Feedback.objects.filter(recipe_id = id)
    recipe_item = Recipe.objects.get(id = id)
    print(recipe_item.image , "details")
    recipe_ingredients = recipe_item.ingredients.split('\r\n')
    recipe_instructions = recipe_item.instructions.split('\r\n')
    if request.method == 'POST':
        user = request.user
        message = request.POST.get('feedback_message')
        rating = request.POST.get('rate')
        feedback_obj = Feedback.objects.filter(user = user)
        if feedback_obj and feedback_obj[0].recipe == recipe_item:
            feedback_obj[0].message = message
            feedback_obj[0].rating = rating
            feedback_instance = feedback_obj[0]
        else:
            feedback_instance = Feedback.objects.create(user = user , message = message ,recipe = recipe_item ,rating = rating)
        feedback_instance.save()
        messages.success(request , "Feedback Saved Successfully")
        return redirect(request.path )
    

    return render(request , 'recipe_details.html',
                  { 'loggedin':request.user.is_authenticated ,
                    'all_feedback':all_feedback,
                    'recipe_item':recipe_item ,
                    'recipe_ingredients':recipe_ingredients ,
                    'recipe_instructions':recipe_instructions ,
                    'category_id':category ,
                    'accessable_user':recipe_item.created_by == request.user, 'fullname':request.user.first_name + ' ' +request.user.last_name if request.user.is_authenticated else ''})


@login_required
def add_recipe(request):
    if request.method == 'POST' and request.FILES['image']:
        image = request.FILES['image']
        title = request.POST.get('title')
        category =  request.POST.get('category')
        description = request.POST.get('description')
        ingredients = request.POST.get('ingredients')
        instructions = request.POST.get('instructions')
        print(image , title ,category, description,ingredients,instructions)
        recipe_obj = Recipe(title = title , image = image , category=Category.objects.get(name = category) , description = description , ingredients = ingredients , instructions = instructions ,created_by = request.user)
        recipe_obj.save()
        return redirect('/recipe/'+ category)
    return render(request , 'recipe_form.html' ,
                   {'loggedin':request.user.is_authenticated ,
                    'add':True ,
                    'fullname':request.user.first_name + ' ' +request.user.last_name if request.user.is_authenticated else ''})


@login_required
def update_recipe(request, category, id):
    recipe_obj = Recipe.objects.get(id=id)
    print(recipe_obj.image , "update")
    if request.user == recipe_obj.created_by:
        if request.method == 'POST':
            image = request.FILES.get('image')
            
            title = request.POST.get('title')
            category = request.POST.get('category')
            description = request.POST.get('description')
            ingredients = request.POST.get('ingredients')
            instructions = request.POST.get('instructions')
            recipe_obj.title = title
            recipe_obj.image = image or recipe_obj.image
            recipe_obj.category = Category.objects.get(name=category)
            recipe_obj.description = description
            recipe_obj.ingredients = ingredients
            recipe_obj.instructions = instructions
            recipe_obj.save()
            return redirect('/recipe/' + category + '/' + str(id))
            
    else:
        return HttpResponse("Not allowed")
    return render(request, 'recipe_form.html', {'recipe_obj': recipe_obj , 
                                                'loggedin':request.user.is_authenticated ,
                                                'fullname':request.user.first_name + ' ' +request.user.last_name if request.user.is_authenticated else ''})

@login_required
def delete_item(request , category , id):
    recipe_item = Recipe.objects.get(id = id)
    if recipe_item.created_by == request.user:
        recipe_item.delete()
        return redirect('/recipe/'+ category)
    else:
        return HttpResponse("""{'message':f"You are not permitted to Delete {recipe_item.created_by.first_name}'s item...", 'success':False}""")


def test(request):
    all_recipe = Recipe.objects.all()
    string = request.GET.get('inputText')
    data = []
    if string:
        recipe_filter = all_recipe.filter(Q(title__icontains = string))
        data = list(map(lambda recipe: {
            'id':recipe.id ,
            'title':recipe.title ,
            'category':recipe.category.name

        }, recipe_filter))
    return JsonResponse({'data':data })