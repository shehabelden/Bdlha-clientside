import 'package:bdlha/Persntation/Main_Screan/main%20screen.dart';
import 'package:bdlha/Persntation/login/base/cubt/cubt.dart';
import 'package:bdlha/Persntation/login/base/state/state.dart';
import 'package:bdlha/Persntation/welcome_badge/WelcomeBadge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LoginCheck extends StatelessWidget {
  const LoginCheck({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubt=LoginCubt.get(context);
    cubt.token();
    return BlocConsumer<LoginCubt,BaseState>(
        listener: (c,i){},
        builder: (context,i) {
          if(cubt.tokenKey!=null){
            return const MainScreen();
          }else{
            return const WelcomeBadge();
          }
        }
    );
  }
}
