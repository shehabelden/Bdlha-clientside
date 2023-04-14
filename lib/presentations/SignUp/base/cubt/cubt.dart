import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Domain/Dio/dio_get.dart';
import '../state/state.dart';
class SignUpCubt extends Cubit<BaseSignUpState>{
  SignUpCubt() : super(SignUpInitState());
  static  SignUpCubt get(context)=>BlocProvider.of(context);
  String ? tokenKey;
  void signUpMethod(username,password,password2,email){
    if(password == password2){
    DioHelper.postData(url: "auth/signup", data: {
      'username':username,
      'password':password,
      "email":email,
    });}
    emit(SignUpState());
  }
}