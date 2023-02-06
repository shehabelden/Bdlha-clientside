import 'package:bdlha/Persntation/Main_Screan/cubt/state/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NavBarCubt extends Cubit<MainNavState>{
  NavBarCubt() : super(MainNavInit());
  static NavBarCubt get(context)=>BlocProvider.of(context);
  int listCont=0;
  cont(int index,List list){
    if(index<list.length){
    listCont=index;
    }
    print(index);
    emit(ContNavMain());
}
}