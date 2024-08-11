import 'package:bloc/bloc.dart';
import 'package:kafiil_task/core/api_service.dart';
import 'package:kafiil_task/features/countries/data/models/Country.dart';
import 'package:meta/meta.dart';

import '../../../data/country_repo/country_repo.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryRepo countryRepo;
  CountryCubit({required this.countryRepo}) : super(CountryInitial());
  getCountryIndex({ String? quaryIndex}) async {
    emit(CountryLoading());
    var result = await countryRepo.fetchCountry(
        endPoints: "api/test/country${quaryIndex!=null?quaryIndex:''}");
    result.fold(
      (error) {
        emit(CountryFailure(message: error.message!));
      },
      (countryModel) {
        emit(CountrySuccess(country: countryModel));
      },
    );
  }
}
