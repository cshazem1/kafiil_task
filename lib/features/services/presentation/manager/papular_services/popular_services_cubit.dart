import 'package:bloc/bloc.dart';
import 'package:kafiil_task/features/services/presentation/manager/papular_services/papular_services_state.dart';

import '../../../data/services_repo/services_repo.dart';


class PopularServicesCubit extends Cubit<PopularServicesState> {
  PopularServicesCubit({required this.servicesRepo}) : super(PopularServicesInitial());

  ServicesRepo servicesRepo;
  fetchPopularServices() async {
    emit( PopularServicesLoading());
    var result=await servicesRepo.fetchPopularServices();
    result.fold((failure) {
      emit( PopularServicesFailure(message: failure.message!));

    }, (data) {
      emit( PopularServicesSuccess(serviceModel: data));
    },);

  }

}
