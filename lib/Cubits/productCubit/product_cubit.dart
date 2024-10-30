import 'package:appstore/Models/ProductModel.dart';
import 'package:appstore/helpers/DioHelper.dart';
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {

  ProductCubit() : super(ProductInitial());


  Future<void >addProduct(String title, double price, String description, String category, String imageUrl)async{
    try{
      emit(addProductsLoading());
      final response = await DioHelper.patchData(path: "products",body: {
      "title": title,
      "price": price.toString(),
      "description": description,
      "image": imageUrl,
      "category":category

      });
      if(response.statusCode ==200){
        emit(addProductsSuccess());
      }
      else{
        emit(addProductsError("error"));
      }
      
    }catch(e){
      emit(addProductsError("error"));
      
    }
  }
  Future<void >updateProduct(int id,String title, double price, String description, String category, String imageUrl)async{
    try{
      emit(updateProductsLoading());
      final response = await DioHelper.patchData(path: "products/$id",body: {
        "title": title,
        "price": price.toString(),
        "description": description,
        "image": imageUrl,
        "category":category

      });
      if(response.statusCode ==200){
        print(response.data);
        emit(updateProductsSuccess());
      }
      else{
        emit(updateProductsError("error"));
      }

    }catch(e){
      emit(updateProductsError("error"));

    }
  }
}
