# Generated by Django 4.2.11 on 2024-05-09 10:22

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0002_remove_userprofile_id_userprofile_created_at_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='recipe',
            name='image',
            field=models.ImageField(default=django.utils.timezone.now, upload_to='recipe_images/'),
            preserve_default=False,
        ),
    ]