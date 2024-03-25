from django.db import models

# Create your models here.


class Note(models.Model):
    id = models.AutoField(primary_key=True)
    username = models.ForeignKey(
        'User', models.DO_NOTHING, db_column='username', blank=True, null=True)
    title = models.CharField(max_length=255, blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    date_created = models.DateTimeField()
    date_modified = models.DateTimeField()

    def __str__(self):
        return self.title

    class Meta:
        managed = False
        db_table = 'note'


class User(models.Model):
    username = models.CharField(primary_key=True, max_length=255)
    password = models.CharField(max_length=255, blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    phone = models.CharField(max_length=20, blank=True, null=True)

    def __str__(self):
        return self.username

    class Meta:
        managed = False
        db_table = 'user'
