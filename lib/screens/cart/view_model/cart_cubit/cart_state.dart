abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final List<dynamic> items; 
  CartSuccess(this.items);
}

class CartFailure extends CartState {
  final String errMessage;
  CartFailure(this.errMessage);
}