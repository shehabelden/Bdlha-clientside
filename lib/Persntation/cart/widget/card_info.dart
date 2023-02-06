import 'package:flutter/material.dart';

Widget cardInfo(index){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("name $index"),
      Text("number $index"),
    ],
  );
}