import 'package:bookia_application/core/networking/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:dio_pretty_logger/dio_pretty_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioFactory {
  static Dio? dio;

  static Future<void> initialize() async {
    final SharedPreferences prefs =
        await SharedPreferences.getInstance();

    final String? token = prefs.getString("authtoken");

    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          if (token != null && token.isNotEmpty)
            "Authorization": "Bearer $token",
        },
      ),
    );

    dio?.interceptors.add(
      DioPrettyLogger(
        showRequest: true,
        showRequestHeader: false,
        showRequestBody: true,
        showResponseBody: true,
        showResponseHeader: false,
        showError: true,
        compact: true,
        maxWidth: 100,
        chunkSize: 20,
        maxListPrintLength: 10,
        enabled: true,
      ) as Interceptor,
    );
  }
}