import 'dart:convert';
import 'package:http/http.dart'as http;
import '../model/listview_api_model.dart';


class ListService {

  Future<ListApiModel> getDataToListsService({required String id,required String token})
  async{


    final response = await http.post(
      Uri.parse('https://qaveromobileapp-portal.azurewebsites.net/api/Patient/v1.2/FacilitiesList'),
      headers: <String,String>
      {
        "Content-type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },

       body: jsonEncode(<String,dynamic>
      {
        "phelbotomistId": id,
      })

    );

    if(response.statusCode == 200)
    {
      final data = jsonDecode(response.body);
      return ListApiModel.fromJson(data);
    }
    else
    {
      throw Exception('${response.statusCode} : ${response.reasonPhrase}');
    }
  }
}


// https://github.com/MuhammadHamza5261/My-Portfolio/blob/main/lib/services/logintask_service.dart