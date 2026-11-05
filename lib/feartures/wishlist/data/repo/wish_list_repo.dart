import 'package:bookia_application/core/networking/api_endpoints.dart';
import 'package:bookia_application/core/networking/dio_factory.dart';
import 'package:bookia_application/feartures/wishlist/data/models/wish_list_response_model.dart';
import 'package:dio/dio.dart';

class WishListRepo {

  static WishListRepo homeRepo = WishListRepo();

Future<WishListResponseModel?> wishListGet() async {
  try {
    final response = await DioFactory.dio!.get(
      ApiEndpoints.wishList,
      options: Options(
        headers: {
          "Cache-Control": "no-cache",
          "Pragma": "no-cache",
        },
      ),
    );

    print("WISHLIST STATUS: ${response.statusCode}");
    print("WISHLIST RESPONSE: ${response.data}");

    if (response.statusCode == 200) {
      return WishListResponseModel.fromJson(response.data);
    }
  } catch (e) {
    print("WISHLIST GET ERROR: $e");
  }

  return null;
}}