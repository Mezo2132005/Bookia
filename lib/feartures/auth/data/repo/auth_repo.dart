import 'package:bookia_application/core/networking/api_endpoints.dart';
import 'package:bookia_application/core/networking/dio_factory.dart';
import 'package:bookia_application/feartures/auth/data/models/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {

  static AuthRepo authRepo = AuthRepo();

  Future<bool?>login(String email,String password)async{
    
    try{
    final response = await DioFactory.dio?.post(ApiEndpoints.login,
    data: {
      "email": email,
      "password": password,
    }
    );
    if (response?.statusCode == 200){
      LoginResponseModel loginRes =
      LoginResponseModel.fromJson(response?.data);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("authtoken", loginRes.data?.token??"");
      return true;
    }

    }catch(e){return false;}
    return null;
    
  }

}