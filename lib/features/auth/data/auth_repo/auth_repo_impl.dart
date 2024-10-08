import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kafiil_task/core/error/failure.dart';
import 'package:kafiil_task/core/api_service.dart';
import 'package:kafiil_task/features/auth/data/auth_repo/auth_repo.dart';
import 'package:kafiil_task/features/auth/data/models/auth_model/auth_model.dart';

import '../models/auth_model/LoginModels.dart';

class AuthRepoImpl implements AuthRepo{
  ApiService apiService;
  AuthRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, LoginModels>> login({required String email,required String password}) async {

  try {
    Map response= await apiService.post(endPoint: "api/test/user/login",body: {
      'email':email,'password':password

    });
    print(response.toString());
    LoginModels authModel=LoginModels.fromJson(response);

    return right(authModel );
  }
  on Exception catch (e){
    if(e is DioException) {
      return left(ServerFailure.fromDioError(e));
    } else {
      return left(ServerFailure(message: e.toString()) );
    }
}

    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> register({Map<String,dynamic>?headers,Object? body}) async {
   try {
     var response=await apiService.post(endPoint: "api/test/user/register",body:body,headers: headers, );
     return Right(response.toString());
   } on Exception catch (e) {
     if(e is DioException) {
       return left(ServerFailure.fromDioError(e));
     } else {
       return left(ServerFailure(message: e.toString()));
     }
   }

    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, LoginModels>> whoAMI({ String ?token}) async {

    try {

      var response= await apiService.getToken(endPoints: "api/test/user/who-am-i",token: token);

      LoginModels authModel=LoginModels.fromJson(response);
      return right(authModel);
    }
    on Exception catch (e){
      if(e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(message: e.toString()) );
      }
    }
}}