# Create your models here.
# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class TbAkun(models.Model):
    id_akun = models.CharField(max_length=10, blank=True, null=True)
    email = models.CharField(max_length=100, blank=True, null=True)
    password = models.CharField(max_length=100, blank=True, null=True)
    role = models.CharField(max_length=7, blank=True, null=True)
    nama_pegawai = models.CharField(max_length=100, blank=True, null=True)
    nip_nrk = models.CharField(db_column='NIP_NRK', primary_key=True, max_length=100)  # Field name made lowercase.
    alamat = models.TextField(blank=True, null=True)
    telp = models.CharField(max_length=12, blank=True, null=True)


    class Meta:
        managed = False
        db_table = 'tb_akun'


class TbBarang(models.Model):
    id_barang = models.CharField(primary_key=True, max_length=10)
    nama_barang = models.CharField(max_length=100, blank=True, null=True)
    merek = models.CharField(max_length=100, blank=True, null=True)
    satuan = models.CharField(max_length=5, blank=True, null=True)
    pinjam_in = models.IntegerField(blank=True, null=True)
    kembali_out = models.IntegerField(blank=True, null=True)
    price = models.IntegerField(blank=True, null=True)
    price_total = models.IntegerField(blank=True, null=True)
    ruang = models.ForeignKey('TbRuang', models.DO_NOTHING, db_column='ruang', blank=True, null=True)
    gedung = models.ForeignKey('TbGedung', models.DO_NOTHING, db_column='gedung', blank=True, null=True)
    bast_perolehan = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tb_barang'


class TbGedung(models.Model):
    id_gedung = models.CharField(max_length=10, blank=True, null=True)
    gedung = models.CharField(primary_key=True, max_length=10)
    mg_gedung = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tb_gedung'


class TbPeminjaman(models.Model):
    id_peminjaman = models.CharField(primary_key=True, max_length=10)
    id_barang = models.ForeignKey(TbBarang, models.DO_NOTHING, db_column='id_barang')
    no_peminjaman = models.CharField(max_length=10, blank=True, null=True)
    nip_nrk = models.ForeignKey(TbAkun, models.DO_NOTHING, db_column='NIP_NRK', blank=True, null=True)  # Field name made lowercase.
    nama_pegawai = models.CharField(max_length=100, blank=True, null=True)
    tgl_pinjam = models.DateField(blank=True, null=True)
    tgl_kembali = models.DateField(blank=True, null=True)
    bast_disposisi = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tb_peminjaman'


class TbRuang(models.Model):
    id_ruang = models.CharField(max_length=10, blank=True, null=True)
    ruang = models.CharField(primary_key=True, max_length=10)
    pj_ruang = models.CharField(max_length=100, blank=True, null=True)
    gedung = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tb_ruang'