import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import '../../app/cache_helper/cache_helper.dart';
import '../../style/ColorManger/color_manger.dart';
import '../HomeBadge/main_home.dart';
import '../HomeBadge/widget/app_bar/app_bar.dart';
import '../Loved item/cart_view.dart';
import '../cart/cart_view.dart';
import '../notifications/pages/pages.dart';
import 'cubt/cubt/cubt.dart';
import 'cubt/state/state.dart';

class MainScreen extends StatelessWidget {
 static List icons=const[
   Icon(Icons.home,),
   Icon(Icons.login_sharp,),
 ];
 static List badges= const[
    HomeBadge(),
    Loved(),
    NotificationBadge(),
    CartView(),
  ];
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubt=NavBarCubt.get(context);
    return BlocBuilder<NavBarCubt,MainNavState>(
      builder: (c,i) {
        return Scaffold(
          backgroundColor:ColorManager.prime,
            appBar:const PreferredSize(
                preferredSize: Size.fromHeight(75),
                child: AppPar()),
            drawer: Drawer(
              child: Column(
                children: [
             const DrawerHeader(
                decoration: BoxDecoration(
                  color: ColorManager.button,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
                        ListTile(
                         leading:icons[0],
                         title: const Text('create product'),
                         onTap: () {
                             Navigator.pushNamed(context, '/CreateProduct');
                         },
                       ),
                       ListTile(
                         leading:icons[1],
                         title: const Text('log_out'),
                         onTap: () {
                           CacheHelper.removeData(key: "token_pref");
                           CacheHelper.removeData(key: "id");
                         },
        ),
                ]
              ),
            ),
            body:badges[cubt.listCont],
            bottomNavigationBar:BottomNavigationBar(
              elevation: 0,
              items:const [
                BottomNavigationBarItem(
                  icon: Icon(
                      IconlyLight.home,
                      color: ColorManager.button),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      IconlyLight.heart,
                      color: ColorManager.button),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      IconlyLight.notification,
                      color: ColorManager.button),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      IconlyLight.buy,
                      color: ColorManager.button),
                  label: "",
                ),
              ],
              type:BottomNavigationBarType.fixed ,
              backgroundColor:ColorManager.prime,
              currentIndex :cubt.listCont,
              onTap:(index){
                cubt.cont(index,badges);
              },
            ),
        );
      }
    );
  }
}
