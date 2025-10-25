
import 'package:ecommerce/core/failure.dart';
import 'package:ecommerce/core/shared_preference.dart';
import 'package:ecommerce/core/utills/services.dart';

import 'package:ecommerce/screens/Auth/model/auth_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiServices apiServices;
  AuthCubit(this.apiServices) : super(AuthInitial());
  Future<void> SignUp({
    required String name,
    required String email,
    required String password,
    required String repassword,
    required String phone,
  }) async {
    emit(AuthLoadingState());
    try {
      final data = await apiServices.post(
        endPoint: 'auth/signup',
        data: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": repassword,
          "phone": phone,
        },
      );
      print("===================> Response Data: $data");
      final authResponse = AuthResponse.fromJson(data);
      emit(AuthSuccessState(response: authResponse));
    } on Failure catch (e) {
      emit(AuthFailureState(errMessage: e.errMessage));
      print('==============>${e.errMessage}');
    } catch (e) {
      emit(AuthFailureState(errMessage: e.toString()));
      print('==============>${e.toString()}');
    }
  }

  Future<void> Signin({required String password, required String email}) async {
    emit(AuthLoadingState());
    try {
      final data = await apiServices.post(
        endPoint: 'auth/signin',
        data: {'email': email, "password": password},
      );
      print("=======================> Response Data: $data");
      final token = data["token"] ?? data["data"]["token"];
      print("==============================>User Token: $token");
      await CacheHelper.saveData(key: "token", value: token);
      final authResponse = AuthResponse.fromJson(data);
      emit(AuthSuccessState(response: authResponse));
    } on Failure catch (e) {
     emit(AuthFailureState(errMessage: e.errMessage)); 
    } catch (e) {
      emit(AuthFailureState(errMessage: e.toString())) ;
    }
  }
}
