part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}


final class addProductsLoading extends ProductState {

}
final class addProductsSuccess extends ProductState {
}
final class addProductsError extends ProductState {
  String errorMsg;

  addProductsError(this.errorMsg);
}
final class updateProductsLoading extends ProductState {

}
final class updateProductsSuccess extends ProductState {
}
final class updateProductsError extends ProductState {
  String errorMsg;

  updateProductsError(this.errorMsg);
}

