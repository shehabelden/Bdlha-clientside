import 'package:bdlha/Persntation/HomeBadge/MainHome.dart';
import 'package:bdlha/Persntation/HomeBadge/widget/app_bar/app_bar.dart';
import 'package:bdlha/Persntation/Main_Screan/cubt/cubt/cubt.dart';
import 'package:bdlha/Persntation/Main_Screan/cubt/state/state.dart';
import 'package:bdlha/Persntation/cart/CartView.dart';
import 'package:bdlha/style/ColorManger/ColorManger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:bdlha/Persntation/Loved iteam/CartView.dart';
import 'package:bdlha/Persntation/notfication/padges/padges.dart';
List badges= const[
  HomeBadge(),
  Loved(),
  NotificationBadge(),
  CartView(),
];
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubt=NavBarCubt.get(context);
    return BlocBuilder<NavBarCubt,MainNavState>(
      builder: (c,i) {
        return Scaffold(
          backgroundColor:ColorManager.prime,
            appBar: appBar(),
            body:badges[cubt.listCont],
            bottomNavigationBar:BottomNavigationBar(
              elevation: 0,
              items:const [
                BottomNavigationBarItem(
                  icon: Icon(
                      IconlyLight.home,
                      color: ColorManager.Button),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      IconlyLight.heart,
                      color: ColorManager.Button),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      IconlyLight.notification,
                      color: ColorManager.Button),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      IconlyLight.buy,
                      color: ColorManager.Button),
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
