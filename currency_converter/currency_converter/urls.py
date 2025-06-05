from django.contrib import admin
from django.urls import include, path
from django.http import HttpResponse
from drf_spectacular.views import (SpectacularAPIView, SpectacularRedocView,
                                   SpectacularSwaggerView)

urlpatterns = [
    path('', lambda request: HttpResponse('Сервис конвертации валют работает!'), name='home'),
    path('admin/', admin.site.urls),
    path('api/', include('api.urls')),
]

urlpatterns += [
    path('api/', lambda request: HttpResponse('API работает!'), name='api-root'),
    path('schema/', SpectacularAPIView.as_view(), name='schema'),
    path(
        'schema/swagger-ui/',
        SpectacularSwaggerView.as_view(url_name='schema'),
        name='swagger-ui'),
    path(
        'schema/redoc/',
        SpectacularRedocView.as_view(url_name='schema'),
        name='redoc'),
]
