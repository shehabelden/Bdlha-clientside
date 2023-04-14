import 'package:bdlha/db/saved/saved.dart';
import 'package:bdlha/presentations/cart/base/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBase extends Cubit<CartMainState>{
  CartBase() : super(CartInitData());
  static  CartBase get(context)=>BlocProvider.of(context);
  List cartListPram=[];
   gitData() async{
    emit(LoadCartData());
    await SavedDb.get();
    cartListPram =SavedDb.getData;
    print(cartListPram);
    emit(GetCartData());
  }
}