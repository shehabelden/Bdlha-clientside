import 'package:bdlha/Domain/Dio/dio_get.dart';
import 'package:bdlha/Persntation/HomeBadge/cubt/state/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeApiCubt extends Cubit<HomeApiState>{
  HomeApiCubt() : super(HomeApiInitState());
  static  HomeApiCubt get(context)=>BlocProvider.of(context);
  List mainListPram=[];
  Map<String,dynamic> mainMaoPram={};
  void mainList(url) async{
    await DioHelper.getData(url: url).then((value){
      mainListPram=value.data;
    });
    emit(ListHomeApiState());
  }
  void mainMap(url) async{
   await DioHelper.getData(url: url).then((value){
      mainMaoPram=value.data;
    });
    emit(MapHomeApiState());
  }
}