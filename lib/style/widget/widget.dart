import 'package:flutter/material.dart';
import '../size/Container.dart';
class SingleProductList extends StatelessWidget {
  final Map<String,dynamic> mainListPram;
  final Function onTap;
  const SingleProductList({Key? key, required this.onTap, required this.mainListPram,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.only(bottom:20.0,right: 40,left: 40),
            child: Column(
              children: [
                InkWell(
                  onTap:(){
                    onTap();
                    },
                  child: Row(
                    children: [
                      Container(
                        height: (Height.medium*MediaQuery.of(context).size.height)*1.2,
                        width: (Width.medium*MediaQuery.of(context).size.width)*.95,
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(mainListPram['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(mainListPram["name"],
                          style:const TextStyle(
                            fontWeight:FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 20,
                  // thickness: 20,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.black,
                ),
              ],
            ),
        );
  }
}
