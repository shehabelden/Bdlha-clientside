import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Domain/Dio/dio_get.dart';
import '../../../../app/cache_helper/cache_helper.dart';
import '../state/state.dart';
class LoginCubt extends Cubit<BaseState>{
  LoginCubt() : super(LoginInitState());
  static  LoginCubt get(context)=>BlocProvider.of(context);
  String ? tokenKey;
  void token(){
    tokenKey=CacheHelper.get(key:"token_pref",);
    // print("save $token_key");
    emit(TokenState());
  }
  void loginMethod(username,password){
    DioHelper.postData(url: "auth/login", data: {
      'username':username,
      'password':password,
    }).then((value) {
      CacheHelper.put(key:"token_pref",value:value.data["token"].toString());
      CacheHelper.put(key:"id",value:value.data["id"].toString());

    });

    emit(LoginState());
  }
}