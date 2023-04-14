import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../style/button/button.dart';
import '../../style/text/StaticText.dart';
import '../Main_Screan/main_screan.dart';
import '../Main_Widget/auth_field.dart';
import '../Main_Widget/logo.dart';
import 'base/cubt/cubt.dart';
import 'base/state/state.dart';
TextEditingController username=TextEditingController();
TextEditingController password=TextEditingController();
List loginController=[username,password];
List labelList=[StaticText.username,StaticText.password];
class LoginBadge extends StatelessWidget {
  const LoginBadge({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubt=LoginCubt.get(context);
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      logo(
           MediaQuery.of(context).size.height,
           MediaQuery.of(context).size.width,
           StaticText.signIn,
           labelList.length,
      ),
          authField(
              loginController.length,
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
              labelList,
              loginController,
          ),
          BlocBuilder<LoginCubt,BaseState>(
            builder: (context,i) {
              return InkWell(
                onTap:(){
                  cubt.loginMethod(username.text,password.text);
                  MaterialPageRoute(
                    builder: (context) =>const MainScreen(),
                  );
                },
                child: authButton(
                  MediaQuery.of(context).size.height,
                  MediaQuery.of(context).size.width,
                  StaticText.signIn,
                 ),
              );
            }
          ),
        ],
      ),
    );
  }
}