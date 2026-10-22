import 'package:bookia_application/core/networking/api_endpoints.dart';
import 'package:bookia_application/core/networking/dio_factory.dart';
import 'package:bookia_application/feartures/home/data/models/products_model.dart';

class HomeRepo {

  static HomeRepo homeRepo = HomeRepo();

  Future<ProductsModel?>productsGet()async{
    
    try{
    final response = await DioFactory.dio?.get(ApiEndpoints.bestSeller,
    );
    if (response?.statusCode == 200){
      ProductsModel productModel =
      ProductsModel.fromJson(response?.data);
      return productModel;
    }

    }catch(e){return null;}
    return null;
    
  }

}