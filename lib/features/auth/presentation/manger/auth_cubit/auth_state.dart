part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {

}

final class LoginSuccess extends AuthState {
  LoginModels loginModels;
  LoginSuccess({required this.loginModels});
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




final class WhoAmISuccess extends AuthState {
  LoginModels loginModels;
  WhoAmISuccess({required this.loginModels});
}
final class WhoAmILoading extends AuthState {

}
final class WhoAmIFailure extends AuthState {
  String error;
  WhoAmIFailure({ required this.error});

}
final class init extends AuthState {
  init();

}