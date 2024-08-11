import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_task/features/services/presentation/views/widgets/services_view_body.dart';

import '../../../../core/service_located.dart';
import '../../data/services_repo/services_repo_impl.dart';
import '../manager/papular_services/popular_services_cubit.dart';
import '../manager/services_cubit/services_cubit.dart';


class ServicesViews extends StatelessWidget {
  const ServicesViews({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:
      MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    ServicesCubit(servicesRepo: getIt.get<ServicesRepoImpl>())),
            BlocProvider(
                create: (context) => PopularServicesCubit(servicesRepo: getIt.get<ServicesRepoImpl>()))
          ],
          child: ServicesViewBody()),

    );
  }
}

