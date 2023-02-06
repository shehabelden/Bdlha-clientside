import 'package:bdlha/style/ColorManger/ColorManger.dart';
import 'package:bdlha/style/Container/postContainer.dart';
import 'package:bdlha/style/size/Container.dart';
import 'package:flutter/material.dart';
import 'widget/extra tool card.dart';
List listview=[
  "",
  "",
  "",
  "",
  "",
];
class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
            color:ColorManager.prime,
            child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: listview.length,
                      padding: const EdgeInsets.only(left: 20.0,bottom: 20.0),
                      itemBuilder: (BuildContext context, int itemIndex,){
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  postContainer(
                                    MediaQuery.of(context).size.height*Height.medium,
                                    MediaQuery.of(context).size.width*Width.medium,
                                    listview[itemIndex],
                                    8,
                                  ),
                                  Center(
                                    child: cardTools(
                                        MediaQuery.of(context).size.height*Height.medium,
                                        (MediaQuery.of(context).size.width*Width.medium)/2,
                                        itemIndex,
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
                  ),
      ),
    );
  }
}
