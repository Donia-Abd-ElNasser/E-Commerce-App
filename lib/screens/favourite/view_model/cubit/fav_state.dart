part of 'fav_cubit.dart';

abstract class FavState {}

class FavInitial extends FavState {}

class FavLoading extends FavState {}

class FavSuccess extends FavState {
 final List<ProductModel> items;
  FavSuccess(this.items);
}

class FavFailure extends FavState {
  final String errMessage;
  FavFailure(this.errMessage);
}