import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/auth_model/LoginModels.dart';
import '../models/auth_model/auth_model.dart';

abstract class AuthRepo {


  Future<Either<Failure,LoginModels>>login({required String email,required String password});
Future<Either<Failure,String>>register({Map<String,dynamic>?headers,Object? body,});

  Future<Either<Failure,LoginModels>>whoAMI({ String ? token});


}