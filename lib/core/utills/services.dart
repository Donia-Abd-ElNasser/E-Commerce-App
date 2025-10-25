import 'package:dio/dio.dart';
import 'package:ecommerce/core/failure.dart';
import 'package:ecommerce/core/shared_preference.dart';

class ApiServices {
  final Dio _dio;
  static const String baseUrl = 'https://ecommerce.routemisr.com/api/v1/';

  ApiServices()
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            headers: {
              "Content-Type": "application/json",
            },
          ),
        );


  Future<dynamic> get({
    required String endPoint,
  }) async {
    try {
      String? token = CacheHelper.getData(key: 'token');
      print("=== Fetching $endPoint with token: $token ===");

      final response = await _dio.get(
        endPoint,
        options: Options(
          headers: {
            if (token != null) "token": token, 
          },
        ),
      );

      print("API GET RESPONSE: ${response.data}");
      return response.data;
    } on DioException catch (e) {
      print("Dio Error: ${e.response?.data}");
      throw ServerFailure.fromDioError(e);
    }
  }


  Future<dynamic> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      String? token = CacheHelper.getData(key: 'token');
      final response = await _dio.post(
        endPoint,
        data: data,
        options: Options(
          headers: {
            if (token != null) "token": token,
          },
        ),
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print("Dio Error: ${e.response?.data}");
      throw ServerFailure.fromDioError(e);
    }
  }

  
  Future<dynamic> delete({
    required String endPoint,
  }) async {
    try {
      String? token = CacheHelper.getData(key: 'token');
      final response = await _dio.delete(
        endPoint,
        options: Options(
          headers: {
            if (token != null) "token": token,
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      print("Dio Error: ${e.response?.data}");
      throw ServerFailure.fromDioError(e);
    }
  }
}
