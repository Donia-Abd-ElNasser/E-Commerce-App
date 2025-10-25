part of 'home_cubit.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeFailure extends HomeState {
  final String errMessage;

  HomeFailure({required this.errMessage});
}

class HomeSuccess extends HomeState {
  final List<ItemModel> categories;
  final List<ItemModel> brands;
  final List<ProductModel> products;

  HomeSuccess({
    required this.categories,
    required this.brands,
    required this.products,
  });
}
