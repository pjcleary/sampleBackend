from ehr.models import Person
from ehr.serializers import PersonSerializer
from rest_framework import generics

# get multiple people, add person
class PersonList(generics.ListCreateAPIView):
    queryset = Person.objects.all().order_by('name')
    serializer_class = PersonSerializer

#get, update, delete person
class Person(generics.RetrieveUpdateDestroyAPIView):
    queryset = Person.objects.all()
    serializer_class = PersonSerializer