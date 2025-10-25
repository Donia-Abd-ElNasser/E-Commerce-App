import 'package:ecommerce/screens/home/model/product_model.dart';


abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductSuccessState extends ProductState {
  final ProductModel product;
  ProductSuccessState(this.product);


}

class ProductFailureState extends ProductState {
  final String message;
  ProductFailureState(this.message);

}
