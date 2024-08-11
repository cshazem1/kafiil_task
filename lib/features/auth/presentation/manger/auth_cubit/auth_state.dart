part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {

}

final class LoginSuccess extends AuthState {
  AuthModel authModel;
  LoginSuccess({required this.authModel});
}
final class LoginLoading extends AuthState {

}
final class LoginFailure extends AuthState {
  String error;
  LoginFailure({ required this.error});

}
final class RegisterSuccess extends AuthState {
  String data;
  RegisterSuccess({required this.data});
}
final class RegisterLoading extends AuthState {

}
final class RegisterFailure extends AuthState {
String error;
RegisterFailure({required this.error});
}
