import 'package:bookia_application/core/networking/api_result.dart';
import 'package:bookia_application/core/networking/api_endpoints.dart';
import 'package:bookia_application/core/networking/dio_factory.dart';
import 'package:bookia_application/core/networking/error_hander.dart';
import 'package:bookia_application/feartures/wishlist/data/models/wish_list_response_model.dart';
import 'package:dio/dio.dart';

class WishListRepo {
  static WishListRepo homeRepo = WishListRepo();

  Future<ApiResult<WishListResponseModel>> wishListGet() async {
    try {
      final response = await DioFactory.dio?.get(
        ApiEndpoints.wishList,
        options: Options(
          headers: {
            "Cache-Control": "no-cache",
            "Pragma": "no-cache",
          },
        ),
      );

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return ApiSuccess(WishListResponseModel.fromJson(response?.data));
      }

      return ApiError(
        "Received invalid status code: ${response?.statusCode}",
      );
    } catch (e) {
      return ApiError(ErrorHandler.handleError(e));
    }
  }
}