import 'package:bdlha/presentations/profile/cubt/cubt.dart';
import 'package:bdlha/presentations/profile/cubt/state.dart';
import 'package:bdlha/style/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/cache_helper/cache_helper.dart';
import '../HomeBadge/prodact/prodact.dart';
class ProfileBadge extends StatelessWidget {
  const ProfileBadge({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    var cubt =ProfileCubt.get(context);
    String id=CacheHelper.get(key: "id");
    cubt.getProfileData("auth/prof/$id");
    cubt.getUSerData("Categories/userproduct?id=$id");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        foregroundColor: Colors.black,
      ),
      extendBodyBehindAppBar: true,
      body: BlocBuilder<ProfileCubt,ProfileState>(
        builder: (context,state) {
          return state is LoadState ? const Center(child:  CircularProgressIndicator()) :Column(
            children: [
              SizedBox(
                height:300 ,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        image: DecorationImage(
                            image:NetworkImage(cubt.mainMapPram!["avatar"]),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 75.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration:BoxDecoration(
                            color: Colors.blue,
                            borderRadius:BorderRadius.circular(50),
                            image: DecorationImage(
                              image:NetworkImage(cubt.mainMapPram!["avatar"],
                            ),
                              fit: BoxFit.cover
                          ),
                        ),
                        ),
                    ),
                    ),
                          ],
                ),
              ),
              SizedBox(
                height: 530,
                child: ListView.builder(
                    itemCount: cubt.mainListPram!.length,
                    shrinkWrap: true,
                    itemBuilder: (c,i){
                      return SingleProductList(
                          mainListPram:cubt.mainListPram![i],
                          onTap: () async{
                            await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Product(id:cubt.mainListPram![i]["id"], listCat:const [],
                                      ),
                                ));
                          });
                    }),
              ),

            ],
          );
        }
      ),
    );
  }
}