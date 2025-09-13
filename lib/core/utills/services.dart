import 'package:dio/dio.dart';
import 'package:ecommerce/core/failure.dart';

class ApiServices {
  final Dio _dio;
  static const String baseUrl = 'https://ecommerce.routemisr.com/api/v1/';
  ApiServices()
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {"Content-Type": "application/json"},
        ),
      );
  Future<dynamic> get({required String endPoint}) async {
    try {
      final response = await _dio.get(endPoint);
      return response.data;
    } on DioException catch (e) {
      ServerFailure.fromDioError(e);
    }
  }
  Future<dynamic> post({required String endPoint,required Map<String,dynamic>data}) async {
    try {
      final response = await _dio.post(endPoint,data: data);
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      ServerFailure.fromDioError(e);
    }
  }
}
