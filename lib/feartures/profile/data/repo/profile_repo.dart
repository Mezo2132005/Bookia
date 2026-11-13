import 'package:bookia_application/core/networking/api_result.dart';
import 'package:bookia_application/core/networking/api_endpoints.dart';
import 'package:bookia_application/core/networking/dio_factory.dart';
import 'package:bookia_application/core/networking/error_hander.dart';
import 'package:bookia_application/feartures/profile/data/models/profile_response_model.dart';
import 'package:dio/dio.dart';

class ProfileRepo {
  static ProfileRepo profileRepo = ProfileRepo();

  Future<ApiResult<ProfileResponseModel>> showProfile() async {
    try {
      final response = await DioFactory.dio?.get(
        ApiEndpoints.showProfile,
        options: Options(
          headers: {
            "Cache-Control": "no-cache",
            "Pragma": "no-cache",
          },
        ),
      );

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return ApiSuccess(ProfileResponseModel.fromJson(response?.data));
      }

      return ApiError(
        "Received invalid status code: ${response?.statusCode}",
      );
    } catch (e) {
      return ApiError(ErrorHandler.handleError(e));
    }
  }
}