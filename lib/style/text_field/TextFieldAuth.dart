import 'package:flutter/material.dart';
Widget textFieldAuth(String label,controller,height){
  return  Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: SizedBox(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border:OutlineInputBorder()
      ),

        controller:controller,
      ),
    ),
  );
}