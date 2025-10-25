import 'package:ecommerce/core/utills/services.dart';
import 'package:ecommerce/screens/home/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.apiServices) : super(ProductInitialState());

  final ApiServices apiServices;

  Future<void> fetchProductDetails({required String productId}) async {
    emit(ProductLoadingState());
    try {
      final response = await apiServices.get(endPoint: 'products/$productId');

      final data = response["data"];
      final product = ProductModel.fromJson(data);

      emit(ProductSuccessState(product));
    } catch (e) {
      emit(ProductFailureState(e.toString()));
    }
  }
}
