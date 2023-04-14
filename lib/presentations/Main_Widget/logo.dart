import 'package:flutter/material.dart';
import '../../style/image_app.dart';
import '../../style/size/container.dart';
import '../../style/size/padding_app.dart';
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