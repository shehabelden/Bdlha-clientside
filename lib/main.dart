import 'package:bdlha/Domain/Dio/dio_get.dart';
import 'package:bdlha/app/cache_helper/cache_helper.dart';
import 'package:bdlha/db/saved/saved.dart';
import 'package:bdlha/presentations/SignUp/signup.dart';
import 'package:bdlha/presentations/cart/base/base.dart';
import 'package:bdlha/presentations/login/login.dart';
import 'package:bdlha/presentations/login_check/login_check.dart';
import 'package:bdlha/presentations/welcome_badge/welcome_bage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentations/HomeBadge/cubt/cubt/cubt.dart';
import 'presentations/Main_Screan/cubt/cubt/cubt.dart';
import 'presentations/SignUp/base/cubt/cubt.dart';
import 'presentations/create_product/create_product_badge.dart';
import 'presentations/create_product/cubt/cubt.dart';
import 'presentations/login/base/cubt/cubt.dart';
import 'presentations/profile/cubt/cubt.dart';
import 'style/ColorManger/color_manger.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  await SavedDb.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>LoginCubt()),
        BlocProvider(create: (context)=>SignUpCubt()),
        BlocProvider(create: (context)=>HomeApiCubt()),
        BlocProvider(create: (context)=>CartBase()),
        BlocProvider(create: (context)=>NavBarCubt()),
        BlocProvider(create: (context)=>ProfileCubt()),
        BlocProvider(create: (context)=>CreateProductApiCubt()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor:ColorManager.prime,
        ),
        initialRoute: '/',
        routes: {
          '/s': (context) => const LoginCheck(),
          '/welcomeBadge': (context) => const WelcomeBadge(),
          '/Login': (context) => const LoginBadge(),
          '/SignUp': (context) => const SignUpBadge(),
          '/CreateProduct': (context) =>  CreateProduct(),
        },
        home:  LoginCheck(),
      ),
    );
  }
}

