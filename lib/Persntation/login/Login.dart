import 'package:bdlha/Persntation/Main_Widget/Auth_Field.dart';
import 'package:bdlha/Persntation/Main_Widget/Logo.dart';
import 'package:bdlha/Persntation/login/base/cubt/cubt.dart';
import 'package:bdlha/Persntation/login/base/state/state.dart';
import 'package:bdlha/style/button/button.dart';
import 'package:bdlha/style/text/StaticText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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