import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:qa_vero_mobileapp_api/api_constants.dart';
import 'package:qa_vero_mobileapp_api/model/login_api_model.dart';

import '../shared_preferences_client.dart';

class LoginService
{
  Future<LoginApiModel?> setDataToLoginService({required String email, required String password})
  async{

    final response = await http.post(Uri.parse('https://qaveromobileapp-portal.azurewebsites.net/api/Users/v1.0/Login'),
        headers: <String,String>
        {
          "Content-type": "application/json",
          "Accept": "application/json",

        },
        body: jsonEncode(<String,dynamic>
        {
          "email": email,
          "password": password,

        })
    );

    if(response.statusCode == 200)

    {

      final data = jsonDecode(response.body);
      return LoginApiModel.fromJson(data);

    }


    else
    {

      throw Exception('${response.statusCode} : ${response.reasonPhrase}');

    }

  }
}