import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qa_vero_mobileapp_api/model/listview_api_model.dart';
import '../../repository/listview_repository.dart';
import '../../shared_preferences_client.dart';
import 'listview_event.dart';
import 'listview_state.dart';


class ListsBloc extends Bloc<ListEvent,ListState>{

  ListApiModel? listApiModel;
  ListRepository  listsRepository = ListRepository();

  ListsBloc():super(InitialState()){
    on<ListEvent>((event, emit ) async{
      if(event is SetDataToListsEvent)
      {

        emit(ListInProgressState());

        try{

          String id =  await SharedPreferencesClient.getId();
          String token =  await SharedPreferencesClient.getToken();

          listApiModel = (await listsRepository.setDatatoListsLists(id: id.toString(), token: token.toString()));
          emit(ListDataisLoadedState (listApiModel: listApiModel!));

        }

        catch(e)
        {
          emit(ListsErrorState('Something went wrong'));
        }

      }
    });
  }
}