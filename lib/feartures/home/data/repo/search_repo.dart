import 'package:bookia_application/core/networking/api_result.dart';
import 'package:bookia_application/core/networking/api_endpoints.dart';
import 'package:bookia_application/core/networking/dio_factory.dart';
import 'package:bookia_application/core/networking/error_hander.dart';
import 'package:bookia_application/feartures/home/data/models/products_model.dart';

class SearchRepo {
  static SearchRepo searchRepo = SearchRepo();

  Future<ApiResult<ProductsModel>> searchProducts(String search) async {
    try {
      final response = await DioFactory.dio?.get(
        ApiEndpoints.productSearch,
        queryParameters: {"name": search},
      );
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return ApiSuccess(ProductsModel.fromJson(response?.data));
      }

      return ApiError(
        "Received invalid status code: ${response?.statusCode}",
      );
    } catch (e) {
      return ApiError(ErrorHandler.handleError(e));
    }
  }
}