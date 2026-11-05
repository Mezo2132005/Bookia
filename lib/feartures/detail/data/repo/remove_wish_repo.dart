import 'package:bookia_application/core/networking/api_endpoints.dart';
import 'package:bookia_application/core/networking/dio_factory.dart';

class RemoveWishRepo {

  static RemoveWishRepo removeWishRepo = RemoveWishRepo();

  Future<bool?>wishListRemove(int? id)async{
    
    try{
    final response = await DioFactory.dio?.post(ApiEndpoints.removeToWishList,
    queryParameters: {"product_id":id}
    );
    if (response?.statusCode == 200){
      return true;
    }

    }catch(e){return null;}
    return null;
    
  }

}