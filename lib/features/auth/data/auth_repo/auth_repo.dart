import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/auth_model/auth_model.dart';

abstract class AuthRepo {


  Future<Either<Failure,AuthModel>>login({required String email,required String password});
Future<Either<Failure,String>>register({Map<String,dynamic>?headers,Object? body});
}