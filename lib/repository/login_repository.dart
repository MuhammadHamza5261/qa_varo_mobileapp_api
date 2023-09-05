import 'dart:convert';
import '../model/login_api_model.dart';
import '../service/login_service.dart';
import '../shared_preferences_client.dart';

class LoginRepository{


  LoginApiModel? loginModel;
  LoginService loginService = LoginService();

  Future<LoginApiModel> setDatatoLoginLogin({required String email, required String password})async{

    loginModel = await  loginService.setDataToLoginService(email: email, password: password);
    return loginModel!;

  }

}