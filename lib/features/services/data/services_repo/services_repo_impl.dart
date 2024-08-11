import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kafiil_task/core/api_service.dart';
import 'package:kafiil_task/core/error/failure.dart';
import 'package:kafiil_task/features/services/data/services_model/ServiceModel.dart';
import 'package:kafiil_task/features/services/data/services_repo/services_repo.dart';


class ServicesRepoImpl implements ServicesRepo{
  ApiService apiService;
  ServicesRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, ServiceModel>> fetchPopularServices() async {
  try {
    Map responsive=await  apiService.get(endPoints: "/api/test/service/popular");
    ServiceModel serviceModel=ServiceModel.fromJson(responsive);
    return right(serviceModel);
  } on Exception catch (e) {
    if(e is DioException)
      {
        return left(ServerFailure.fromDioError(e));

      }
    else {
      return left(ServerFailure(message: e.toString()));
    }

  }

    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ServiceModel>> fetchServices() async {

    try {

      Map responsive=await  apiService.get(endPoints: "/api/test/service");
      ServiceModel serviceModel=ServiceModel.fromJson(responsive);
      return right(serviceModel);
    } on Exception catch (e) {
      if(e is DioException)
      {
        return left(ServerFailure.fromDioError(e));

      }
      else {
        return left(ServerFailure(message: e.toString()));
      }

    }
    throw UnimplementedError();
  }
  
  
  
}