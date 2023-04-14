import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/state.dart';
class NavBarCubt extends Cubit<MainNavState>{
  NavBarCubt() : super(MainNavInit());
  static NavBarCubt get(context)=>BlocProvider.of(context);
  int listCont=0;
  cont(int index,List list){
    if(index<list.length){
    listCont=index;
    }
  //  print(index);   //for test
    emit(ContNavMain());
}
}