import 'package:bdlha/presentations/create_product/cubt/cubt.dart';
import 'package:bdlha/presentations/create_product/cubt/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../style/text_field/TextFieldAuth.dart';
class CreateProduct extends StatelessWidget {
  final TextEditingController name=TextEditingController();
  final TextEditingController topic=TextEditingController();
  final TextEditingController bio=TextEditingController();
  CreateProduct({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubt=CreateProductApiCubt.get(context);
    final List textField=[
      name,
      topic,
      bio,
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:const Text("Create Product"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body:BlocBuilder<CreateProductApiCubt,CreateProductMainState>(
        builder: (context,state) {
          return Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                ListView.builder(
                  itemCount: textField.length,
                  shrinkWrap: true,
                  itemBuilder: (c,i){
                    return Padding(
                      padding: const EdgeInsets.only(top: 20.0,left: 20,right: 20),
                      child: textFieldAuth("s",textField[i],10),
                    );
                  },
                ),
                InkWell(
                  onTap: (){
                    cubt.getImage();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Container(
                      height: 80,
                      width: 200,
                      color: Colors.black,
                      alignment: Alignment.center,
                      child:const Text("getImage",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async{
                    FormData formData=FormData.fromMap(
                        {
                          "user":1,
                          "name":name.text,
                          "bio":bio.text,
                          "topic":topic.text,
                          "rate":5,
                          "image":await MultipartFile.fromFile(
                                cubt.imagePath!.path,
                              filename: cubt.imageExtension),
                        }
                    );
                    cubt.mainMap("Categories/createproduct",formData);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Container(
                      height: 80,
                      width: 200,
                      color: Colors.black,
                      alignment: Alignment.center,
                      child:const Text("create product",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
