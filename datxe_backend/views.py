from rest_framework import viewsets
from .models import Nguoidung
from .serializers import NguoidungSerializer

class NguoiDungViewSet(viewsets.ModelViewSet):
    queryset = Nguoidung.objects.all()
    serializer_class = NguoidungSerializer
