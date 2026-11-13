import 'package:bookia_application/core/networking/api_result.dart';
import 'package:bookia_application/core/networking/api_endpoints.dart';
import 'package:bookia_application/core/networking/dio_factory.dart';
import 'package:bookia_application/core/networking/error_hander.dart';
import 'package:dio/dio.dart';

class LogOutRepo {
  static LogOutRepo logOutRepo = LogOutRepo();

  Future<ApiResult<bool>> logOut() async {
    try {
      final response = await DioFactory.dio?.post(
        ApiEndpoints.logOut,
        options: Options(
          headers: {
            "Cache-Control": "no-cache",
            "Pragma": "no-cache",
          },
        ),
      );

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return const ApiSuccess(true);
      }

      return ApiError(
        "Received invalid status code: ${response?.statusCode}",
      );
    } catch (e) {
      return ApiError(ErrorHandler.handleError(e));
    }
  }
}