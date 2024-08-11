import 'package:dartz/dartz.dart';
import 'package:kafiil_task/core/error/failure.dart';
import 'package:kafiil_task/features/services/data/services_model/ServiceModel.dart';

abstract class ServicesRepo{

  Future<Either<Failure,ServiceModel>> fetchServices();
  Future<Either<Failure,ServiceModel>> fetchPopularServices();



}