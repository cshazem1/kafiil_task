import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:kafiil_task/core/api_service.dart';
import 'package:kafiil_task/core/error/failure.dart';
import 'package:kafiil_task/features/services/presentation/manager/services_cubit/services_state.dart';
import 'package:meta/meta.dart';

import '../../../data/models/dependencies_models/DependenciesModels.dart';

part 'dependent_state.dart';

class DependentCubit extends Cubit<DependentState> {
  ApiService apiService=ApiService(dio: Dio());
  DependentCubit() : super(DependentInitial());
  
  fetchDependent() async {
    emit(DependentLoading());
 try {
   var result=await   apiService.get(endPoints: "api/test/dependencies");
   DependenciesModels dependenciesModels=DependenciesModels.fromJson(result);
   emit(DependentSuccess(dependenciesModels:dependenciesModels ));
 } on Exception catch (e) {
   if(e is DioException)
     {
       return ServerFailure.fromDioError(e);
     }
   else {
     return ServicesFailure(message: e.toString());
   }
   // TODO
 }
  }
  initial(){
    emit(DependentInitial());
  }
  
}
