import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kafiil_task/core/api_service.dart';
import 'package:kafiil_task/core/error/failure.dart';
import 'package:kafiil_task/features/countries/data/country_repo/country_repo.dart';
import 'package:kafiil_task/features/countries/data/models/Country.dart';

class CountryRepoImpl implements CountryRepo{
  ApiService apiService;
  CountryRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, Country>> fetchCountry({required String endPoints}) async {
  try {
    var result=await  apiService.get(endPoints: endPoints);
Country countryModel=Country.fromJson(result);
    return right(countryModel);
  } on Exception catch (e) {
if(e is DioException)
  {
    return left(ServerFailure.fromDioError(e));
  }
else {
  return left(ServerFailure(message: e.toString()));
}
  }
  }



}