import 'package:bookia_application/core/networking/api_endpoints.dart';
import 'package:bookia_application/core/networking/dio_factory.dart';
import 'package:dio/dio.dart';

class LogOutRepo {

  static LogOutRepo logOutRepo = LogOutRepo();

Future<bool?> logOut() async {
  try {
    final response = await DioFactory.dio!.post(
      ApiEndpoints.logOut,
      options: Options(
        headers: {
          "Cache-Control": "no-cache",
          "Pragma": "no-cache",
        },
      ),
    );

    print("Logout STATUS: ${response.statusCode}");
    print("Logout RESPONSE: ${response.data}");

    if (response.statusCode == 200) {
      return true;
    }
  } catch (e) {
    print("Logout GET ERROR: $e");
  }

  return null;
}}