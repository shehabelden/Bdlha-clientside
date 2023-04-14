// import 'package:bdlha/models/saved/saved_model.dart';
import 'package:bdlha/presentations/HomeBadge/cubt/cubt/cubt.dart';
import 'package:bdlha/presentations/HomeBadge/cubt/state/state.dart';
import 'package:bdlha/style/ColorManger/ColorManger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import '../../../models/saved/saved_model.dart';
import '../../../style/size/Container.dart';
class Product extends StatelessWidget {
  final int id;
  final List listCat;
  const Product({Key? key, required  this.id,required this.listCat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubt=HomeApiCubt.get(context);
    cubt.mainMap("Categories/Products/$id");
    return  BlocBuilder<HomeApiCubt,HomeApiState>(builder: (controller,state){
      return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0),
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: state is LoadingHomeState ? const Center(child:CircularProgressIndicator())
            : SingleChildScrollView(
              child: Column(
                children: [
              Image(
                image:NetworkImage("${cubt.mainMaoPram["image"]}"),
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("${cubt.mainMaoPram["name"]}",style:const TextStyle(
                           fontSize: 24,
                           fontWeight: FontWeight.bold,
                         )),
                         IconButton(
                             onPressed: (){},
                             icon:const Icon(IconlyLight.heart)),
                       ],
                     ),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 15.0),
                       child: Text("${cubt.mainMaoPram["bio"]}",style: TextStyle(
                         fontSize: 18,
                         color: Colors.grey.withOpacity(.6),
                       )),
                     ),
                     Text("${cubt.mainMaoPram["topic"]}",style:const TextStyle(
                       fontSize: 12,
                     )),
                     Padding(
                       padding: const EdgeInsets.only(right: 40.0),
                       child: SizedBox(
                           height: 200,
                           child: ListView.builder(
                             shrinkWrap: true,
                               itemCount: 5,
                               scrollDirection: Axis.horizontal,
                               itemBuilder: (c,i){
                             return const Padding(
                               padding:  EdgeInsets.only(left: 50.0),
                               child: Icon(Icons.star_border),
                             );
                           })),
                     ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                        const Text("Products",style: TextStyle(
                           fontSize: 24,
                           fontWeight: FontWeight.bold,
                         )),
                         Padding(
                           padding: const EdgeInsets.only(bottom: 40.0),
                           child: SizedBox(
                             width: double.infinity,
                             height:Height.medium*MediaQuery.of(context).size.height,
                             child: ListView.builder(
                                 shrinkWrap: true,
                                 itemCount:listCat.length,
                                 scrollDirection: Axis.horizontal,
                                 itemBuilder: (c,i){
                                   return Padding(
                                     padding:const  EdgeInsets.only(right: 10.0),
                                     child: Container(
                                         width:Width.small*MediaQuery.of(context).size.width,
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(8),
                                           image: DecorationImage(
                                             image: NetworkImage(
                                               "https://bdlha.pythonanywhere.com${listCat[i]["image"]}",
                                             ),
                                             fit: BoxFit.cover,
                                           ),
                                         ),
                                         ),
                                   );
                                 }),
                           ),
                         ),
                       ],
                     ),
                   ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            decoration:const BoxDecoration(
                              color: ColorManager.Button,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                              ),
                            ),
                            child:const Text("EXCHANGE",style: TextStyle(
                              color: Colors.white,
                            ),),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){
                            cubt.add(
                              SavedModel(
                                name:cubt.mainMaoPram["name"],
                                pio:cubt.mainMaoPram["bio"],
                                EXCHANGE:cubt.mainMaoPram["name"],
                                rate: cubt.mainMaoPram["rate"],
                                image:cubt.mainMaoPram["image"],
                              ),
                            );
                          },
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:const BorderRadius.only(
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child:const Text("add to cart"),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        ),
      );
    });
  }
}