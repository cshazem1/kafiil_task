import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_task/core/service_located.dart';
import 'package:kafiil_task/features/countries/data/country_repo/country_repo.dart';
import 'package:kafiil_task/features/countries/data/country_repo/country_repo_impl.dart';
import 'package:kafiil_task/features/countries/presentation/manager/country_country/country_cubit.dart';
import 'package:kafiil_task/features/countries/presentation/views/widgets/countries_view_body.dart';


class CountriesView extends StatefulWidget {
  const CountriesView({super.key});

  @override
  State<CountriesView> createState() => _CountriesViewState();
}

class _CountriesViewState extends State<CountriesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
          create: (context) => CountryCubit(countryRepo: getIt.get<CountryRepoImpl>()),
          child: CountriesViewBody(),
        )
    );
  }
}


