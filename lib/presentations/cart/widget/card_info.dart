import 'package:flutter/material.dart';

Widget cardInfo(Map<String,dynamic> index){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("name ${index["name"]}"),
      Text("number ${index["rate"]}"),
    ],
  );
}