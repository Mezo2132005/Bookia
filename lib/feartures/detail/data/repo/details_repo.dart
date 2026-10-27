import 'package:bookia_application/core/networking/api_endpoints.dart';
import 'package:bookia_application/core/networking/dio_factory.dart';
import 'package:bookia_application/feartures/detail/data/models/details_model.dart';

class DetailsRepo {

  static DetailsRepo detailsRepo = DetailsRepo();

  Future<DetailsModel?>productGet(int id)async{
    
    try{
    final response = await DioFactory.dio?.get("${ApiEndpoints.productDetails}$id",
    );
    if (response?.statusCode == 200){
      DetailsModel detailsModel =
      DetailsModel.fromJson(response?.data);
      return detailsModel;
    }

    }catch(e){return null;}
    return null;
    
  }

}