import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:kafiil_task/core/error/failure.dart';
import 'package:kafiil_task/core/utils/routers/app_routes.dart';
import 'package:kafiil_task/features/auth/data/auth_repo/auth_repo_impl.dart';
import 'package:kafiil_task/features/auth/data/models/auth_model/auth_model.dart';
import 'package:kafiil_task/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:kafiil_task/features/countries/data/models/Country.dart';

import 'core/api_service.dart';
import 'core/service_located.dart';
import 'features/auth/presentation/manger/Dependent/dependent_cubit.dart';
import 'features/countries/data/models/Country.dart';

class KafiilTask extends StatelessWidget {
  KafiilTask({super.key});
  @override
  Widget build(BuildContext context) {
  //  country();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(providers: [
            BlocProvider(
            create: (context) => AuthCubit(getIt.get<AuthRepoImpl>())),
        BlocProvider(
        create: (context) => DependentCubit(),)
        ],
          child: MaterialApp.router(
            theme: ThemeData(scaffoldBackgroundColor: Colors.white),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRoutes.router,
          ),
        );
      },
    );
  }

 /* Future<void> country() async {
    ApiService apiService=ApiService(dio: Dio());
    var result=await  apiService.get(endPoints: "api/test/country");
    Country countryModel=Country.fromJson(result);
    print(countryModel.status);
        }*/

  Future<void> post() async {
    await storeToken(
        r'$2y$10$fP5FNholiV19aNJNReioJ.VG7yHtJ2ywel8KKlqs5wh43SKb9uEJ2');
    Dio dio = Dio();
    String? token = await getToken();

    dio.options.headers['Authorization'] = '$token';

    Response response =
        await dio.get('https://test.kafiil.com/api/test/user/who-am-i');
   // print(response);
  }

  final storage = FlutterSecureStorage();

  Future<void> storeToken(String token) async {
    await storage.write(key: 'access_token', value: token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'access_token');
  }
}
