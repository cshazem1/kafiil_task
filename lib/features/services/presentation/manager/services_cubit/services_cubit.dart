
import 'package:bloc/bloc.dart';
import 'package:kafiil_task/features/services/data/services_repo/services_repo.dart';
import 'package:kafiil_task/features/services/presentation/manager/services_cubit/services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit({required this.servicesRepo}) : super(ServicesInitial());
  ServicesRepo servicesRepo;
  fetchServices() async {
    emit(ServicesLoading());
   var result=await servicesRepo.fetchServices();
    result.fold((failure) {
      emit(ServicesFailure(message: failure.message!));

    }, (data) {
      emit(ServicesSuccess(serviceModel: data));
    },);

  }

}
