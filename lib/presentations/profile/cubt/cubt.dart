import 'package:bdlha/Domain/Dio/dio_get.dart';
import 'package:bdlha/presentations/profile/cubt/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubt extends Cubit<ProfileState>{
  ProfileCubt() : super(ProfileInit());
  static ProfileCubt get(context)=>BlocProvider.of(context);
  Map <String,dynamic> ? mainMapPram;
  List ? mainListPram;
  getProfileData(url)async{
    emit(LoadState());
    await DioHelper.getData(url: url).then((value){
      mainMapPram=value.data;
    });
    emit(GetProfile());
  }
  getUSerData(url)async{
    emit(LoadState());
    await DioHelper.getData(url: url).then((value){
      mainListPram=value.data;
    });
    emit(GetUSer());
  }

}