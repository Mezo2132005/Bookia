import 'package:bookia_application/core/networking/api_endpoints.dart';
import 'package:bookia_application/core/networking/dio_factory.dart';
import 'package:bookia_application/core/networking/error_hander.dart';
import 'package:bookia_application/feartures/auth/data/models/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Adjust these imports to wherever you placed the files
import 'package:bookia_application/core/networking/api_result.dart';

class AuthRepo {
  static AuthRepo authRepo = AuthRepo();

  Future<ApiResult<LoginResponseModel>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiEndpoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final loginRes = LoginResponseModel.fromJson(response?.data);

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("authtoken", loginRes.data?.token ?? "");

        return ApiSuccess(loginRes);
      }

      return ApiError(
        "Received invalid status code: ${response?.statusCode}",
      );
    } catch (e) {
      return ApiError(ErrorHandler.handleError(e));
    }
  }
}