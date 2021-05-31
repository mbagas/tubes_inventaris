from django.contrib import admin
from .models import TbAkun, TbBarang, TbGedung, TbPeminjaman, TbRuang
# Register your models here.

admin.site.site_header = 'inventaris ITERA'

admin.site.register(TbRuang)
admin.site.register(TbAkun)
admin.site.register(TbBarang)
admin.site.register(TbGedung)
admin.site.register(TbPeminjaman)