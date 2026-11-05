import 'package:bookia_application/core/networking/api_endpoints.dart';
import 'package:bookia_application/core/networking/dio_factory.dart';

class AddWishRepo {

  static AddWishRepo addWishRepo = AddWishRepo();

  Future<bool?>wishListAdd(int? id)async{
    
    try{
    final response = await DioFactory.dio?.post(ApiEndpoints.addToWishList,
    queryParameters: {"product_id":id}
    );
    if (response?.statusCode == 200){
      return true;
    }

    }catch(e){return null;}
    return null;
    
  }

}