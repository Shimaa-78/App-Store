import 'package:appstore/helpers/DioHelper.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/ProductModel.dart';

part 'get_broduct_by_category_state.dart';

class GetBroductByCategoryCubit extends Cubit<GetBroductByCategoryState> {
  GetBroductByCategoryCubit() : super(GetBroductByCategoryInitial());
  Future<void> getBroductByCategoryCubit(String categoryName) async {
    try {
      emit(GetBroductByCategoryLoading());
      final response =
     await DioHelper.getData(path: 'products/category/$categoryName');
      if(response.statusCode == 200){
        List<dynamic> data = response.data;
        List<ProductModel>? products =
        data.map((product) => ProductModel.fromJson(product)).toList();
        emit(GetBroductByCategorySuccess(products));
      }
      else{
        emit(GetBroductByCategoryError("Error"));
      }

    } catch (e) {
      print(e.toString());
      emit(GetBroductByCategoryError("Error"));
    }
  }
}
