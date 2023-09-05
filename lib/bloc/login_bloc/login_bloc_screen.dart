import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qa_vero_mobileapp_api/model/login_api_model.dart';
import 'package:qa_vero_mobileapp_api/repository/login_repository.dart';

import '../../shared_preferences_client.dart';
import 'login_event.dart';
import 'login_state.dart';


class LoginTaskBloc extends Bloc<LoginTaskEvent,LoginTaskState>{

  LoginApiModel? loginApiModel;
  LoginRepository loginRepository = LoginRepository();


  LoginTaskBloc():super(InitialState()){

    on<LoginTaskEvent>((event,emit) async{

      if(event is SetDataToLoginTaskEvent)
      {
        emit(LoginTaskInProgressState());
        try{
          loginApiModel = await loginRepository.setDatatoLoginLogin(
            email: event.email,
            password: event.password,
          );


          ///check the status is true then navigate to another screen ///This is statement is can decide the thue user will be navigate or not!!!

          if(loginApiModel!.isSuccess ==true){

            // set the id
            String id = loginApiModel!.data.superAdminId.toString();

            print('My token is : $id');

            // set token from shared preferences
            await SharedPreferencesClient.setId(id);

            //set the token


            String token = loginApiModel!.data.token.toString();
            print('My name is:  $token');

            await SharedPreferencesClient.setToken(token);









            emit(LoginTaskDataIsLoadedState(loginApiModel: loginApiModel!));
          }

          else{
            emit(LoginTaskDataIsNotLoadedState(msg: loginApiModel!.message));
          }
        }
        catch(e)
        {
          print("$e");
          emit(LoginTaskErrorState(e.toString()));
        }

      }
    });



  }

}