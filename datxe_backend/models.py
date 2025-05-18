from django.db import models


class Cataixe(models.Model):
    maca = models.AutoField(db_column='maCa', primary_key=True)  # Field name made lowercase.
    mataixe = models.ForeignKey('Taixe', models.DO_NOTHING, db_column='maTaiXe')  # Field name made lowercase.
    maxe = models.ForeignKey('Xe', models.DO_NOTHING, db_column='maXe')  # Field name made lowercase.
    gioxuatphat = models.TimeField(db_column='gioXuatPhat')  # Field name made lowercase.
    ngayxuatphat = models.DateField(db_column='ngayXuatPhat')  # Field name made lowercase.
    diadiemxuatphat = models.CharField(db_column='diaDiemXuatPhat', max_length=25)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'cataixe'


class Chitietdatxe(models.Model):
    machitiet = models.AutoField(db_column='maChiTiet', primary_key=True)  # Field name made lowercase.
    madatxe = models.ForeignKey('Datxe', models.DO_NOTHING, db_column='maDatXe')  # Field name made lowercase.
    maca = models.ForeignKey(Cataixe, models.DO_NOTHING, db_column='maCa')  # Field name made lowercase.
    tenkhach = models.CharField(db_column='tenKhach', max_length=50)  # Field name made lowercase.
    sodienthoaikhach = models.CharField(db_column='soDienThoaiKhach', max_length=15)  # Field name made lowercase.
    diemtra = models.CharField(db_column='diemTra', max_length=100)  # Field name made lowercase.
    diemdon = models.CharField(db_column='diemDon', max_length=100)  # Field name made lowercase.
    matuyenduong = models.ForeignKey('Tuyenduong', models.DO_NOTHING, db_column='maTuyenDuong')  # Field name made lowercase.
    trangthai = models.CharField(db_column='trangThai', max_length=50)  # Field name made lowercase.
    ghichu = models.TextField(db_column='ghiChu', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'chitietdatxe'


class Danhgia(models.Model):
    madatxe = models.OneToOneField('Datxe', models.DO_NOTHING, db_column='maDatXe', primary_key=True)  # Field name made lowercase.
    diemso = models.IntegerField(db_column='diemSo')  # Field name made lowercase.
    binhluan = models.TextField(db_column='binhLuan', blank=True, null=True)  # Field name made lowercase.
    ngaydanhgia = models.DateField(db_column='ngayDanhGia')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'danhgia'


class Datxe(models.Model):
    madatxe = models.AutoField(db_column='maDatXe', primary_key=True)  # Field name made lowercase.
    mahanhkhach = models.ForeignKey('Hanhkhach', models.DO_NOTHING, db_column='maHanhKhach')  # Field name made lowercase.
    thoigiandat = models.DateTimeField(db_column='thoiGianDat')  # Field name made lowercase.
    manhanvien = models.ForeignKey('Nhanvien', models.DO_NOTHING, db_column='maNhanVien', blank=True, null=True)  # Field name made lowercase.
    maca = models.ForeignKey(Cataixe, models.DO_NOTHING, db_column='maCa')  # Field name made lowercase.
    diemtra = models.CharField(db_column='diemTra', max_length=100)  # Field name made lowercase.
    diemdon = models.CharField(db_column='diemDon', max_length=100)  # Field name made lowercase.
    matuyenduong = models.ForeignKey('Tuyenduong', models.DO_NOTHING, db_column='maTuyenDuong')  # Field name made lowercase.
    trangthai = models.CharField(db_column='trangThai', max_length=50)  # Field name made lowercase.
    ghichu = models.TextField(db_column='ghiChu', blank=True, null=True)  # Field name made lowercase.
    yeucauchungxe = models.IntegerField(db_column='yeuCauChungXe')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'datxe'


class Hanhkhach(models.Model):
    mahanhkhach = models.OneToOneField('Nguoidung', models.DO_NOTHING, db_column='maHanhKhach', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'hanhkhach'


class Nguoidung(models.Model):
    manguoidung = models.AutoField(db_column='maNguoiDung', primary_key=True)  # Field name made lowercase.
    hoten = models.CharField(db_column='hoTen', max_length=50)  # Field name made lowercase.
    sodienthoai = models.CharField(db_column='soDienThoai', max_length=15)  # Field name made lowercase.
    matkhau = models.CharField(db_column='matKhau', max_length=255)  # Field name made lowercase.
    email = models.CharField(max_length=100, blank=True, null=True)
    vaitro = models.ForeignKey('Vaitro', models.DO_NOTHING, db_column='vaiTro')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'nguoidung'


class Nhanvien(models.Model):
    manhanvien = models.OneToOneField(Nguoidung, models.DO_NOTHING, db_column='maNhanVien', primary_key=True)  # Field name made lowercase.
    ngayvaolam = models.DateField(db_column='ngayVaoLam')  # Field name made lowercase.
    cccd = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'nhanvien'


class Taixe(models.Model):
    mataixe = models.OneToOneField(Nguoidung, models.DO_NOTHING, db_column='maTaiXe', primary_key=True)  # Field name made lowercase.
    cccd = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'taixe'


class Tuyenduong(models.Model):
    matuyenduong = models.AutoField(db_column='maTuyenDuong', primary_key=True)  # Field name made lowercase.
    diemdon = models.CharField(db_column='diemDon', max_length=25)  # Field name made lowercase.
    diemtra = models.CharField(db_column='diemTra', max_length=25)  # Field name made lowercase.
    giacuoc = models.DecimalField(db_column='giaCuoc', max_digits=10, decimal_places=2)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'tuyenduong'


class Vaitro(models.Model):
    mavaitro = models.AutoField(db_column='maVaiTro', primary_key=True)  # Field name made lowercase.
    tenvaitro = models.CharField(db_column='tenVaiTro', max_length=15)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'vaitro'


class Xe(models.Model):
    maxe = models.AutoField(db_column='maXe', primary_key=True)  # Field name made lowercase.
    biensoxe = models.CharField(db_column='bienSoXe', max_length=20)  # Field name made lowercase.
    loaixe = models.CharField(db_column='loaiXe', max_length=50, blank=True, null=True)  # Field name made lowercase.
    sochongoi = models.IntegerField(db_column='soChoNgoi')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'xe'
