import 'package:bookia_application/core/networking/api_result.dart';
import 'package:bookia_application/core/networking/api_endpoints.dart';
import 'package:bookia_application/core/networking/dio_factory.dart';
import 'package:bookia_application/core/networking/error_hander.dart';
import 'package:bookia_application/feartures/detail/data/models/details_model.dart';

class DetailsRepo {
  static DetailsRepo detailsRepo = DetailsRepo();

  Future<ApiResult<DetailsModel>> productGet(int id) async {
    try {
      final response = await DioFactory.dio?.get(
        "${ApiEndpoints.productDetails}$id",
      );
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return ApiSuccess(DetailsModel.fromJson(response?.data));
      }

      return ApiError(
        "Received invalid status code: ${response?.statusCode}",
      );
    } catch (e) {
      return ApiError(ErrorHandler.handleError(e));
    }
  }
}