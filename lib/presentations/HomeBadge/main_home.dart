import 'package:bdlha/presentations/HomeBadge/cubt/cubt/cubt.dart';
import 'package:bdlha/style/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubt/state/state.dart';
import 'prodact/category_badge.dart';
class HomeBadge extends StatelessWidget {
  const HomeBadge({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var base=HomeApiCubt.get(context);
    base.mainHomeList("Categories/");
    return BlocBuilder<HomeApiCubt,HomeApiState>(
      builder: (context,state) {
        return  state is LoadingHomeState ? const Center(
          child:CircularProgressIndicator(),
        ) :  Padding(
          padding: const EdgeInsets.only(top: 10.0,),
          child: ListView.builder(
              itemCount: base.mainListPram.length,
              itemBuilder: (c,i){
            return SingleProductList(
                mainListPram:base.mainListPram[i],
                onTap: () async{
                await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            CategoryBadge(id:base.mainListPram[i]["id"]),
                      ));
                });
          }),
        );
      }
    );
  }
}