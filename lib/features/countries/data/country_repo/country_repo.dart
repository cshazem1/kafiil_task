import 'package:dartz/dartz.dart';
import 'package:kafiil_task/core/error/failure.dart';
import 'package:kafiil_task/features/countries/data/models/Country.dart';

abstract class CountryRepo{

  Future<Either<Failure,Country>>fetchCountry({required String endPoints});

}