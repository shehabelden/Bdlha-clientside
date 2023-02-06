import 'package:flutter/material.dart';
AppBar appBar(){
  return AppBar(
    title:const Center(
      child:  Text("bdlha",style: TextStyle(
        color: Colors.black,
      ),
        textAlign: TextAlign.center,
      ),
    ),
    backgroundColor: Colors.white10,
    elevation: 0,
    actions: [
      IconButton(onPressed: (){}, icon:const Icon(
        Icons.person_outline_rounded,
        color: Colors.black,)
      ),
    ],
    leading: IconButton(onPressed: (){}, icon:const Icon(
      Icons.menu,
      color: Colors.black,),
    ),
  );
}