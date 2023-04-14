import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubt/cubt/cubt.dart';
import '../cubt/state/state.dart';
import 'prodact.dart';
class CategoryBadge extends StatelessWidget {
  final int id;
  const CategoryBadge({Key? key,required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubt=HomeApiCubt.get(context);
    cubt.mainCategoryList("Categories/Product?id=$id");
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.black,
        foregroundColor:Colors.black ,
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      extendBody: true,
      body: BlocBuilder<HomeApiCubt,HomeApiState>(
          builder: (context,state){
            return state is LoadingHomeState ? const Center(child:  CircularProgressIndicator()) : Padding(
              padding: const EdgeInsets.only(top: 20,right: 20,left: 20,),
              child: GridView.builder(
                  itemCount: cubt.mainListCategoryPram.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing:10,
                  ),
                  itemBuilder: (c,i){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 5,
                            child: InkWell(
                              onTap: () async{
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>  Product(
                                          id:cubt.mainListCategoryPram[i]["id"],
                                          listCat: cubt.mainListCategoryPram,
                                      ),
                                    ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color:Colors.white,
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://bdlha.pythonanywhere.com/${cubt.mainListCategoryPram[i]['image']}",
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              cubt.mainListCategoryPram[i]["name"],
                              style:const TextStyle(
                              fontWeight:FontWeight.bold,
                            ),
                            ),
                          ),

                        ],
                      ),
                    );
                  }),
            );
          }
      ),
    );
  }
}