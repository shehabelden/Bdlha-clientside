import 'package:flutter/material.dart';

import '../ColorManger/color_manger.dart';
import '../size/container.dart';
import '../size/padding_app.dart';
Widget authButton(height,width,text){
  return Padding(
    padding:  EdgeInsets.only(top:PaddingApp.welcomeButton*height),
    child: Container(
      height:Height.bigButton*height,
      width:Width.bigButton*width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorManager.button,
        borderRadius: BorderRadius.circular((height*Height.bigButton)/8)
      ),
      child: Text(text,style:const TextStyle(
        color: ColorManager.secondColor,
      ),),
    ),
  );
}