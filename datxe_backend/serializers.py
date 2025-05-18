from rest_framework import serializers
from .models import Nguoidung, Cataixe, Chitietdatxe, Danhgia, Datxe, Hanhkhach, Nhanvien, Tuyenduong

class NguoidungSerializer(serializers.ModelSerializer):
    class Meta:
        model = Nguoidung
        fields = '__all__'
        
class CataixeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cataixe
        fields = '__all__'
        
class ChitietdatxeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Chitietdatxe
        fields = '__all__'
        
class DanhgiaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Danhgia
        fields = '__all__'
        
class DatxeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Datxe
        fields = '__all__'
        
class HanhkhachSerializer(serializers.ModelSerializer):
    class Meta:
        model = Hanhkhach
        fields = '__all__'
        
class NhanvienSerializer(serializers.ModelSerializer):
    class Meta:
        model = Nhanvien
        fields = '__all__'
        
class TuyenduongSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tuyenduong
        fields = '__all__'

