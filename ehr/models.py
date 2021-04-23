from django.db import models
from simple_history.models import HistoricalRecords

# Create your models here.
class Person(models.Model):
	MALE = 'M'
	FEMALE = 'F'
	OTHER = 'O'
	UNKNOWN = 'U'

	GENDER = ((MALE, 'male'),
					(FEMALE, 'female'),
					(OTHER, 'other'),
					 (UNKNOWN, 'unknown'))

	id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=150, blank=True, null=True)
	dateOfBirth = models.DateField(auto_now=False, auto_now_add=False)
	gender = models.CharField(max_length=1, choices=GENDER, default=UNKNOWN)
	history = HistoricalRecords()