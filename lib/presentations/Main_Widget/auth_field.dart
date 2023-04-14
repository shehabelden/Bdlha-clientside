import 'package:flutter/material.dart';

import '../../style/size/padding_app.dart';
import '../../style/text_field/TextFieldAuth.dart';
Widget authField(length,width,height,label,controller){
  return  ListView.builder(
      shrinkWrap: true,
      itemCount: length,
      itemBuilder: (c,i){
        return Padding(
          padding:  EdgeInsets.only(
            left: PaddingApp.loginTextFieldWidth*width,
            right: PaddingApp.loginTextFieldWidth*width,
            bottom:(PaddingApp.loginTextFieldWidth*width)*1.2,
          ),
          child: textFieldAuth(
            label[i],
            controller[i],
            height,
          ),
        );
      }
  );
}