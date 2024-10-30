part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class CategoryLoading extends CategoryState {}
final class CategorySuccess extends CategoryState {
  List<String> categories;
  CategorySuccess({required this.categories});

}
final class CategoryError extends CategoryState {
  String errormsg;
  CategoryError(this.errormsg);

}
