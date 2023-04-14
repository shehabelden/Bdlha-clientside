import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Domain/Dio/dio_get.dart';
import 'state.dart';
class CreateProductApiCubt extends Cubit<CreateProductMainState>{
  CreateProductApiCubt() : super(CreateProductInitState());
  static  CreateProductApiCubt get(context)=>BlocProvider.of(context);
  XFile ? imagePath;
  String ? imageExtension;
  final ImagePicker picker = ImagePicker();
  void mainMap(url, data) async{
    await DioHelper.postData(url: url,data:data).then((response){
      var jsonResponse = jsonDecode(response.toString());
      var testData = jsonResponse['histogram_counts'].cast<double>();
      var averageGrindSize = jsonResponse['average_particle_size'];

    });
    emit(PostState());
  }
  void getImage() async{
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imagePath = XFile(image!.path);
     imageExtension = imagePath!.toString().split('.').last;
    emit(GetImageState());
  }
}