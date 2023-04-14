import 'package:flutter/material.dart';
import '../../style/ColorManger/color_manger.dart';
import '../../style/Container/post_container.dart';
import '../../style/size/container.dart';
import 'widget/extra_tool_love.dart';
List listview=[
];
class Loved extends StatelessWidget {
  const Loved({Key? key}) : super(key: key);
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
                                    child: cardToolsLoved(
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
