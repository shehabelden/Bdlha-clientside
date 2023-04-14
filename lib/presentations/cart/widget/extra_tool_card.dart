import 'package:bdlha/presentations/cart/widget/card_info.dart';
import 'package:flutter/material.dart';
Widget cardTools(height,width,itemIndex){
 return Padding(
   padding: const EdgeInsets.only(top:30.0),
   child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Padding(
         padding:const  EdgeInsets.only(left: 15.0),
         child: cardInfo(itemIndex),
       ),
       Padding(
         padding: const EdgeInsets.only(top:20,left: 10),
         child: Row(
           children: [
             Padding(
               padding: const EdgeInsets.only(right:8.0),
               child: InkWell(
                 onTap: (){},
                 child: Container(
                   height:height/4,
                   width:width/2,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular((height/4)/8),
                     color: Colors.grey[200],
                   ),
                   alignment: Alignment.center,
                   child: const Text("buy"),
                 ),
               ),
             ),
             InkWell(
               onTap: (){},
               child: Container(
                 height:height/4,
                 width:width/2,
                 decoration: BoxDecoration(
                   color: Colors.grey[200],
                   borderRadius: BorderRadius.circular((height/4)/8),
                 ),
                 alignment: Alignment.center,
                 child:const Text("loved"),
               ),
             ),
           ],
         ),
       ),
     ],

   ),
 );

}