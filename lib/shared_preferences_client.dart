

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClient {
  static const String _ktoken = 'token';
  static const String _superAdminId = 'id';
  static const String _superAdminName = 'name';
  static const String _email = 'email';



  //creating a setter of token
  static Future<void> setToken(String token) async
  {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString(_ktoken, token);

  }




  //creating a getter of token
  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString(_ktoken);
    return userName!;
  }



  // creating a setter of id

  static Future<void> setId(String id) async
  {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString(_superAdminId, id);

  }



  //creating a getter of id
  static Future<String> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString(_superAdminId);
    return userName!;
  }


  //name




  static Future<void> setName(String name) async
  {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString(_superAdminName, name);

  }



  //creating a getter of id
  static Future<String> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString(_superAdminName);
    return userName!;
  }


//  email


  static Future<void> setEmail(String email) async
  {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString(_email, email);

  }



  //creating a getter of id
  static Future<String> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString(_email);
    return userName!;
  }











}

