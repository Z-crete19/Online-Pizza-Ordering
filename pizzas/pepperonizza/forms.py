from django import forms

class ImageUploadForm(forms.Form):

    profile_pic = forms.ImageField()