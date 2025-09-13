part of 'home_cubit.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}

final class HomeBrandsFailure extends HomeState {
  final String errMessage;

  HomeBrandsFailure({required this.errMessage});
}
final class HomeAllProductsFailure extends HomeState {
  final String errMessage;

  HomeAllProductsFailure({required this.errMessage});
}
final class HomeCategoriesFailure extends HomeState {
  final String errMessage;

  HomeCategoriesFailure({required this.errMessage});
}
class HomeCategoriesSuccess extends HomeState {
  final List<ItemModel> categories;
  HomeCategoriesSuccess({required this.categories});
}

class HomeBrandsSuccess extends HomeState {
  final List<ItemModel> brands;
  HomeBrandsSuccess({required this.brands});
}

class HomeProductsSuccess extends HomeState {
  final List<ProductModel> products;
  HomeProductsSuccess({required this.products});
}
final class HomeBrandsLoading extends HomeState {}
final class HomeCategoriesLoading extends HomeState {}
final class HomeAllProductLoading extends HomeState {}
