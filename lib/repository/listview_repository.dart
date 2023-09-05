import 'package:qa_vero_mobileapp_api/model/listview_api_model.dart';
import '../service/listview_service.dart';


class ListRepository{

  ListApiModel? listApiModel;
  ListService? listService = ListService();


  Future<ListApiModel> setDatatoListsLists({required String id,required String token})
  async{

    listApiModel = await  listService!.getDataToListsService(id: id.toString(), token: token.toString());
    return listApiModel!;
  }
}
