import 'package:appstore/helpers/DioHelper.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  Future <void> getAllCategories()async {
    try{
      emit(CategoryLoading());
      final response =await  DioHelper.getData(path: "products/categories");
      if(response.statusCode==200){
        List<dynamic> data = response.data;
        List<String>? categories= data.cast<String>().toList();
        emit(CategorySuccess(categories: categories));
        print(categories[1]);
      }
      else{
        emit(CategoryError("error"));
      }


    }catch(e){
      print(e.toString());
      emit(CategoryError("connection Error"));
      
    }
  }
}
