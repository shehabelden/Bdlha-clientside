import 'package:bdlha/style/size/PaddingApp.dart';
import 'package:bdlha/style/text_field/TextFieldAuth.dart';
import 'package:flutter/material.dart';

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