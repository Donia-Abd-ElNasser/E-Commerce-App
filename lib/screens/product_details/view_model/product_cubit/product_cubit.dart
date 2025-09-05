import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'product_state.dart';
import '../../model/product_model.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final Dio _dio = Dio();

  Future<void> fetchProductDetails(String productId) async {
    emit(ProductLoading());
    try {
      final response = await _dio.get(
        "https://ecommerce.routemisr.com/api/v1/products/$productId",
      );

      final data = response.data["data"];
      final product = ProductModel.fromJson(data);

      emit(ProductLoaded(product));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
