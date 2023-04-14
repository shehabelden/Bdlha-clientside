import 'package:flutter/material.dart';

import '../../../style/ImageApp.dart';
Widget backGround(height){
  return  Container(
    width: double.infinity,
    height: height,
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage(ImageApp.welcomeImage),
        fit: BoxFit.cover,
      ),
    ),
  );

}