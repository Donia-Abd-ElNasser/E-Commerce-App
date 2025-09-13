part of 'auth_cubit.dart';

abstract class AuthState  {}

final class AuthInitial extends AuthState {}
final class AuthSuccessState extends AuthState {
final AuthResponse response;

  AuthSuccessState({required this.response});
  
}
final class AuthLoadingState extends AuthState {}
final class AuthFailureState extends AuthState {
  final String errMessage;

  AuthFailureState({required this.errMessage});
}