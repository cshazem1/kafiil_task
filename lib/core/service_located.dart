import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kafiil_task/features/auth/data/auth_repo/auth_repo_impl.dart';
import 'package:kafiil_task/features/countries/data/models/Country.dart';
import 'package:kafiil_task/features/services/data/services_repo/services_repo_impl.dart';

import '../features/countries/data/country_repo/country_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

class ServiceLocated {
  void setup() {
    getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
    getIt.registerSingleton<AuthRepoImpl>(
        AuthRepoImpl(apiService: getIt.get<ApiService>()));


    getIt.registerSingleton<CountryRepoImpl>(
        CountryRepoImpl(apiService: getIt.get<ApiService>()));

    getIt.registerSingleton<ServicesRepoImpl>(
        ServicesRepoImpl(apiService: getIt.get<ApiService>()));
  }
}
