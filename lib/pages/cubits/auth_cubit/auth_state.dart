part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginLoding extends AuthState {}

class LoginFailure extends AuthState {
 final String errMessage;
  LoginFailure({required this.errMessage});
}

class RegisterLoding extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailuer extends AuthState {
 final String errMesage;
  RegisterFailuer({required this.errMesage});
}
