import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:kafiil_task/features/auth/data/auth_repo/auth_repo.dart';
import 'package:kafiil_task/features/auth/data/models/auth_model/auth_model.dart';
import 'package:meta/meta.dart';

import '../../../data/models/auth_model/LoginModels.dart';

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
emit(LoginSuccess(loginModels: data));
},);


  }

  register({Map<String,dynamic>?headers,Object? body}) async {
    emit(RegisterLoading());
    var result=await authRepo.register(headers:headers ,body: body,);
result.fold((failure) {
  emit(RegisterFailure(error: failure.message!));
}, (data) {
  emit(RegisterSuccess(data: data));
},);




  }

  whoAmI({ String ?token}) async {
    emit(WhoAmILoading());
    var result=await  authRepo.whoAMI(token:token);
    result.fold((failure) {
      emit(WhoAmIFailure(error: failure.message!));
    }, (data) {
      emit(WhoAmISuccess(loginModels: data));
    },);


  }
  init(){
    emit(AuthInitial());

  }

}
