import 'package:bdlha/Domain/Dio/dio_get.dart';
import 'package:bdlha/Persntation/HomeBadge/cubt/cubt/cubt.dart';
import 'package:bdlha/Persntation/Main_Screan/cubt/cubt/cubt.dart';
import 'package:bdlha/Persntation/Main_Screan/main%20screen.dart';
import 'package:bdlha/Persntation/SignUp/base/cubt/cubt.dart';
import 'package:bdlha/Persntation/login/Login.dart';
import 'package:bdlha/Persntation/login/base/cubt/cubt.dart';
import 'package:bdlha/Persntation/login_check/login_check.dart';
import 'package:bdlha/app/cache_helper/cache_helper.dart';
import 'package:bdlha/style/ColorManger/ColorManger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Persntation/SignUp/SignUp.dart';
import 'Persntation/welcome_badge/WelcomeBadge.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>LoginCubt()),
        BlocProvider(create: (context)=>SignUpCubt()),
        BlocProvider(create: (context)=>HomeApiCubt()),
        BlocProvider(create: (context)=>NavBarCubt()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor:ColorManager.prime ,
        ),
        initialRoute: '/',
        routes: {
          '/s': (context) => const LoginCheck(),
          '/welcomeBadge': (context) => const WelcomeBadge(),
          '/Login': (context) => const LoginBadge(),
          '/SignUp': (context) => const SignUpBadge(),
        },
        home: const MainScreen(),
      ),
    );
  }
}

