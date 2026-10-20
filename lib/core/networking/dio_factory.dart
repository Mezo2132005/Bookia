import 'package:bookia_application/core/networking/api_endpoints.dart';
import 'package:dio/dio.dart';

class DioFactory 
{

  static Dio? dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));
  

}