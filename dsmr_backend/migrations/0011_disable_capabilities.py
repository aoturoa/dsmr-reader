# Generated by Django 2.2.9 on 2020-01-05 13:31

import decimal

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    def migrate_forward(apps, schema_editor):
        try:
            # Only when available.
            settings.DSMRREADER_DISABLED_CAPABILITIES
        except AttributeError:
            return

        BackendSettings = apps.get_model('dsmr_backend', 'BackendSettings')

        if 'electricity_returned' in settings.DSMRREADER_DISABLED_CAPABILITIES:
            BackendSettings.objects.all().update(disable_electricity_returned_capability=True)

        if 'gas' in settings.DSMRREADER_DISABLED_CAPABILITIES:
            BackendSettings.objects.all().update(disable_gas_capability=True)

    def migrate_backward(apps, schema_editor):
        pass  # Nothing to do, but allow going backwards.

    dependencies = [
        ('dsmr_backend', '0010_process_sleep'),
    ]

    operations = [
        migrations.AddField(
            model_name='backendsettings',
            name='disable_electricity_returned_capability',
            field=models.BooleanField(default=False, help_text='Whether to disable electricity return capability. E.g.: When your smart meter erroneous reports electricity returned data, but you do not own any solar panels.'),
        ),
        migrations.AddField(
            model_name='backendsettings',
            name='disable_gas_capability',
            field=models.BooleanField(default=False, help_text='Whether to disable gas capability. E.g.: you’ve switched from using gas to an alternative energy source.'),
        ),
        migrations.RunPython(migrate_forward, migrate_backward),
    ]
