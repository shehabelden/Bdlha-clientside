import 'package:flutter/material.dart';
Widget textFieldAuth(String label,controller,height){
  return  Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: SizedBox(
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
      ),
        controller:controller,
      ),
    ),
  );
}