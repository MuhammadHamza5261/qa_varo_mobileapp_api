
import '../../model/login_api_model.dart';


abstract class LoginTaskState{}

class InitialState extends LoginTaskState{}

class LoginTaskInProgressState extends LoginTaskState{}


class LoginTaskDataIsNotLoadedState extends LoginTaskState{
  String msg;
  LoginTaskDataIsNotLoadedState({required this.msg});
}

class LoginTaskDataIsLoadedState extends LoginTaskState
{

  LoginApiModel loginApiModel;

  LoginTaskDataIsLoadedState({required this.loginApiModel});

}



class LoginTaskErrorState extends LoginTaskState
{
  String error;
  LoginTaskErrorState(this.error);
}