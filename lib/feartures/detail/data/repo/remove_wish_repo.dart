import 'package:bookia_application/core/networking/api_result.dart';
import 'package:bookia_application/core/networking/api_endpoints.dart';
import 'package:bookia_application/core/networking/dio_factory.dart';
import 'package:bookia_application/core/networking/error_hander.dart';

class RemoveWishRepo {
  static RemoveWishRepo removeWishRepo = RemoveWishRepo();

  Future<ApiResult<bool>> wishListRemove(int? id) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiEndpoints.removeToWishList,
        queryParameters: {"product_id": id},
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