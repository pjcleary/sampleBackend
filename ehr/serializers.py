from rest_framework import serializers
from ehr.models import Person

class PersonSerializer(serializers.ModelSerializer):

	class Meta:
		model = Person
		fields = ['id', 'name', 'dateOfBirth', 'gender']