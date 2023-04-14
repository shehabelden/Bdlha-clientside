import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Domain/Dio/dio_get.dart';
import '../state/state.dart';
class NotificationApiCubt extends Cubit<NotificationApiState>{
  NotificationApiCubt() : super(NotificationApiInitState());
  static  NotificationApiCubt get(context)=>BlocProvider.of(context);
  List mainListPram=[];
  Map<String,dynamic> mainMaoPram={};
  void mainList(url) async{
    await DioHelper.getData(url: url).then((value){
      mainListPram=value.data;
    });
    emit(NotificationListApiState());
  }
  void mainMap(url) async{
   await DioHelper.getData(url: url).then((value){
      mainMaoPram=value.data;
    });
    emit(MapNotificationApiState());
  }
}