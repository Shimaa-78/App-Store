import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/ProductModel.dart';
import '../../helpers/DioHelper.dart';

part 'allproducts_state.dart';

class AllproductsCubit extends Cubit<AllproductsState> {
  AllproductsCubit() : super(AllproductsInitial());
  Future<void> getAllProducts() async{
    try{
      emit(ProductsLoading());

      final response = await DioHelper.getData(path: 'products');
      if(response.statusCode == 200){
        List<dynamic> data = response.data;

        List<ProductModel>? products= data.map((product) => ProductModel.fromJson(product)).toList();
        emit(ProductsSuccess(products: products));
      }
      else{emit(ProductsError("Error"));

      }}
    catch(e){
      print(e.toString());
      emit(ProductsError("Connection Error"));
    }



  }
}
