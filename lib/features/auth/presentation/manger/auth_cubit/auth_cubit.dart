import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:kafiil_task/features/auth/data/auth_repo/auth_repo.dart';
import 'package:kafiil_task/features/auth/data/models/auth_model/auth_model.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthModel? authModel;
  AuthCubit(this.authRepo) : super(AuthInitial());
AuthRepo authRepo ;
  login({required String email,required String password}) async {
    emit(LoginLoading());
  var result=await  authRepo.login(email: email, password: password);
result.fold((failure) {
emit(LoginFailure(error: failure.message!));
}, (data) {
emit(LoginSuccess(authModel: data));
},);


  }

  register({Map<String,dynamic>?headers,Object? body}) async {
    emit(RegisterLoading());
    var result=await authRepo.register(headers:headers ,body: body);
result.fold((failure) {
  emit(RegisterFailure(error: failure.message!));
}, (data) {
  emit(RegisterSuccess(data: data));
},);
  }


}
