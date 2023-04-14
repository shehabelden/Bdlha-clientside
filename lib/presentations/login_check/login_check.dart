import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Main_Screan/main_screan.dart';
import '../login/base/cubt/cubt.dart';
import '../login/base/state/state.dart';
import '../welcome_badge/welcome_bage.dart';

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
