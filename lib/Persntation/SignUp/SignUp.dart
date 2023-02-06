import 'package:bdlha/Persntation/Main_Widget/Auth_Field.dart';
import 'package:bdlha/Persntation/Main_Widget/Logo.dart';
import 'package:bdlha/Persntation/SignUp/base/state/state.dart';
import 'package:bdlha/Persntation/SignUp/base/cubt/cubt.dart';
import 'package:bdlha/style/button/button.dart';
import 'package:bdlha/style/text/StaticText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
TextEditingController username=TextEditingController();
TextEditingController email=TextEditingController();
TextEditingController password=TextEditingController();
TextEditingController password2=TextEditingController();
List loginController=[username,email,password,password2,];
List labelList=[StaticText.username,StaticText.email,StaticText.password,StaticText.password2];

class SignUpBadge extends StatelessWidget {
  const SignUpBadge({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubt=SignUpCubt.get(context);
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          logo(
            MediaQuery.of(context).size.height,
            MediaQuery.of(context).size.width,
            StaticText.signUp,
            labelList.length,
          ),
          authField(
            loginController.length,
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
            labelList,
            loginController,
          ),
          BlocBuilder<SignUpCubt,BaseSignUpState>(
            builder: (context,i) {
              return InkWell(
                onTap:(){
                  cubt.signUpMethod(username.text, password.text,password2.text,email.text);
                },
                child: authButton(
                  MediaQuery.of(context).size.height,
                  MediaQuery.of(context).size.width,
                  StaticText.signUp,
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
