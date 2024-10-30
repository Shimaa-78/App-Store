part of 'get_broduct_by_category_cubit.dart';

@immutable
sealed class GetBroductByCategoryState {}

final class GetBroductByCategoryInitial extends GetBroductByCategoryState {}
final class GetBroductByCategoryLoading extends GetBroductByCategoryState {}
final class GetBroductByCategorySuccess extends GetBroductByCategoryState {
  List<ProductModel> products;
  GetBroductByCategorySuccess(this. products);
}
final class GetBroductByCategoryError extends GetBroductByCategoryState {
  String errorMsg;

  GetBroductByCategoryError(this.errorMsg);
}
