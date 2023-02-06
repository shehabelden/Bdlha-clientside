import 'package:bdlha/Domain/Dio/dio_get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bdlha/Persntation/SignUp/base/state/state.dart';
class SignUpCubt extends Cubit<BaseSignUpState>{
  SignUpCubt() : super(SignUpInitState());
  static  SignUpCubt get(context)=>BlocProvider.of(context);
  String ? tokenKey;
  void signUpMethod(username,password,password2,email){
    if(password==password2){
    DioHelper.postData(url: "auth/signup", data: {
      'username':username,
       "email":email,
        'password':password,
    });}
    emit(SignUpState());
  }
}