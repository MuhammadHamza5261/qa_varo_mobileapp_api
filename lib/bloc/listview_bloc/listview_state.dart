
import 'package:qa_vero_mobileapp_api/model/listview_api_model.dart';



abstract class ListState{}

class InitialState  extends ListState{}

class ListInProgressState extends ListState{}

class ListDataisLoadedState extends ListState
{
  ListApiModel listApiModel ;
  ListDataisLoadedState({required this.listApiModel});

}

class ListsErrorState extends ListState
{

  String error;
  ListsErrorState(this.error);


}
