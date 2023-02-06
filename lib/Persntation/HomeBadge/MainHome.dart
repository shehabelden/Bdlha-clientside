import 'package:bdlha/Persntation/HomeBadge/cubt/cubt/cubt.dart';
import 'package:bdlha/Persntation/HomeBadge/cubt/state/state.dart';
import 'package:bdlha/style/size/Container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeBadge extends StatelessWidget {
  const HomeBadge({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubt=HomeApiCubt.get(context);
    cubt.mainList("Categories/");
    return BlocBuilder<HomeApiCubt,HomeApiState>(
      builder: (context,index) {
        return Padding(
          padding: const EdgeInsets.only(top: 60.0,right: 40,left: 40,),
          child: GridView.builder(
              itemCount: cubt.mainListPram.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisExtent: 120,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (c,i){
              return Container(
                height: Height.small*MediaQuery.of(context).size.height,
                width: Width.small*MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color:Colors.black,
                  ),
                ),
                child:Image.network(cubt.mainListPram[i]['image']),
              );
          }),
        );
      }
    );
  }
}
