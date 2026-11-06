import 'package:bookia_application/core/networking/api_endpoints.dart';
import 'package:bookia_application/core/networking/dio_factory.dart';
import 'package:bookia_application/feartures/profile/data/models/profile_response_model.dart';
import 'package:dio/dio.dart';

class ProfileRepo {

  static ProfileRepo profileRepo = ProfileRepo();

Future<ProfileResponseModel?> showProfile() async {
  try {
    final response = await DioFactory.dio!.get(
      ApiEndpoints.showProfile,
      options: Options(
        headers: {
          "Cache-Control": "no-cache",
          "Pragma": "no-cache",
        },
      ),
    );

    print("Profile STATUS: ${response.statusCode}");
    print("Profile RESPONSE: ${response.data}");

    if (response.statusCode == 200) {
      return ProfileResponseModel.fromJson(response.data);
    }
  } catch (e) {
    print("Profile GET ERROR: $e");
  }

  return null;
}}