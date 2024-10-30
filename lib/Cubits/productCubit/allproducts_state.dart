part of 'allproducts_cubit.dart';

@immutable
sealed class AllproductsState {}

final class AllproductsInitial extends AllproductsState {}
final class ProductsLoading extends AllproductsState {

}
final class ProductsSuccess extends AllproductsState {
  List<ProductModel> products;
  ProductsSuccess({required this.products});
}
final class ProductsError extends AllproductsState {
  String errorMsg;

  ProductsError(this.errorMsg);
}
