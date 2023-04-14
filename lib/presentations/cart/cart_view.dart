import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../style/ColorManger/color_manger.dart';
import '../../style/Container/post_container.dart';
import '../../style/size/container.dart';
import 'base/base.dart';
import 'base/state.dart';
import 'widget/extra_tool_card.dart';
class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var base=CartBase.get(context);
    base.gitData();
    return BlocBuilder<CartBase,CartMainState>(
      builder: (context,state) {
        return state is LoadCartData ? const Center(
          child:CircularProgressIndicator(),
        ) : Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Container(
                color:ColorManager.prime,
                child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: base.cartListPram.length,
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
                                        base.cartListPram[itemIndex]["image"],
                                        8,
                                      ),
                                      Center(
                                        child: cardTools(
                                            MediaQuery.of(context).size.height*Height.medium,
                                            (MediaQuery.of(context).size.width*Width.medium)/2,
                                          base.cartListPram[itemIndex],
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
    );
  }
}
