import 'package:bdlha/Domain/Dio/dio_get.dart';
import 'package:bdlha/Persntation/login/base/state/state.dart';
import 'package:bdlha/app/cache_helper/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      // print(value.data["token"].toString());
    });
    emit(LoginState());
  }
}