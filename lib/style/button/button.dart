import 'package:bdlha/style/ColorManger/ColorManger.dart';
import 'package:bdlha/style/size/Container.dart';
import 'package:bdlha/style/size/PaddingApp.dart';
import 'package:flutter/material.dart';
Widget authButton(height,width,text){
  return Padding(
    padding:  EdgeInsets.only(top:PaddingApp.welcomeButton*height),
    child: Container(
      height:Height.bigButton*height,
      width:Width.bigButton*width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorManager.Button,
        borderRadius: BorderRadius.circular((height*Height.bigButton)/8)
      ),
      child: Text(text,style:const TextStyle(
        color: ColorManager.secondColor,
      ),),
    ),
  );
}