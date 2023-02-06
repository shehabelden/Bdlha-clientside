import 'package:bdlha/style/ImageApp.dart';
import 'package:bdlha/style/size/Container.dart';
import 'package:bdlha/style/size/PaddingApp.dart';
import 'package:flutter/material.dart';
Widget logo(height,width,text,number){
  return Padding(
    padding:EdgeInsets.only(
      top:(PaddingApp.welcomeText*height)/number,
      bottom: (PaddingApp.welcomeText*height)/number,
    ),
    child: Column(
      children: [
        Image.asset(ImageApp.logoImage,
          height: Height.logo*height,
          width: Width.logo*width,),
        Padding(
          padding:EdgeInsets.only(top:10.0*number),
          child: Text(text,style:const TextStyle(
            fontSize: 24,
            fontWeight:FontWeight.bold,
          )),
        ),
      ],
    ),
  );

}