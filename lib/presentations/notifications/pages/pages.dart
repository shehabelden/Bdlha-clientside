import 'package:flutter/material.dart';

import '../../../style/size/container.dart';
class NotificationBadge extends StatelessWidget {
  const NotificationBadge({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: 5,
          itemBuilder: (c,i){
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0,left: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: (Height.avtar * MediaQuery.of(context).size.height)/1.6,
                        width:  (Height.avtar * MediaQuery.of(context).size.height)/1.6,
                        decoration: BoxDecoration(
                            color:Colors.blue,
                            borderRadius: BorderRadius.circular((Height.avtar * MediaQuery.of(context).size.height)/1.6),
                        ),
                      ),
                      SizedBox(
                        height: (Height.avtar * MediaQuery.of(context).size.height)/3.2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            children: [
                             const Text("name",
                              style:TextStyle(
                                 color: Colors.black,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 14
                              ) ,
                              ),
                              Text("info",
                                style:TextStyle(
                                    color: Colors.black.withOpacity(.4),
                                    fontSize: 12
                                ) ,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 20,
                    // thickness: 20,
                    indent: 12,
                    endIndent: 12,
                    color: Colors.black,
                  ),
                ],
              ),
            );
          }
    );
  }
}
