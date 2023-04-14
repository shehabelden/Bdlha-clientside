import 'package:bdlha/presentations/HomeBadge/cubt/state/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Domain/Dio/dio_get.dart';
import '../../../../db/saved/saved.dart';
class HomeApiCubt extends Cubit<HomeApiState>{
  HomeApiCubt() : super(HomeApiInitState());
  static  HomeApiCubt get(context)=>BlocProvider.of(context);
  List mainListPram=[];
  List mainListCategoryPram=[];
  List <Map> listCat=[];
  Map<String,dynamic> mainMaoPram={};
  void mainHomeList(url) async{
    emit(LoadingHomeState());
    await DioHelper.getData(url: url).then((value){
      mainListPram=value.data;
    });
    emit(ListHomeApiState());
  }
  void mainCategoryList(url) async{
    emit(LoadingHomeState());
    await DioHelper.getData(url: url,).then((value){
      mainListCategoryPram=value.data;
    });
    print(mainListCategoryPram);
    emit(ListCategoryState());
  }
  void add(data) async{
    await SavedDb.insert(data);
    // print(data);
    emit(Add());
  }
  void mainMap(url) async{
    emit(LoadingHomeState());
    await DioHelper.getData(url: url).then((value){
      mainMaoPram=value.data;
    });
    emit(MapHomeApiState());
  }
}