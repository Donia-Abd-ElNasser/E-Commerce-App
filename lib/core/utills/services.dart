import 'package:dio/dio.dart';
import 'package:ecommerce/screens/product_details/model/product_model.dart';


class ProductService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://ecommerce.routemisr.com/api/v1/",
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  Future<ProductModel> getProductDetails(String id) async {
    try {
      final response = await _dio.get("products/$id");
      return ProductModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? "Failed to load product");
    }
  }
}
