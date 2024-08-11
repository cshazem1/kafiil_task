import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil_task/core/service_located.dart';
import 'package:kafiil_task/features/services/data/services_repo/services_repo_impl.dart';
import 'package:kafiil_task/features/services/presentation/manager/papular_services/popular_services_cubit.dart';
import 'package:kafiil_task/features/services/presentation/views/widgets/custom_card_Services.dart';

import '../../manager/papular_services/papular_services_state.dart';

class CustomPopularWidget extends StatefulWidget {
  const CustomPopularWidget({
    super.key,
  });

  @override
  State<CustomPopularWidget> createState() => _CustomPopularWidgetState();
}

class _CustomPopularWidgetState extends State<CustomPopularWidget> {
  @override
  void initState() {
    BlocProvider.of<PopularServicesCubit>(context).fetchPopularServices();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularServicesCubit, PopularServicesState>(
      builder: (context, state) {
        if(state is PopularServicesSuccess) {
          return SizedBox(
            height: 192.h,
            child: ListView.builder(
              clipBehavior: Clip.none,
              itemCount:  state.serviceModel.data?.length??0,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {

                return  CustomCardServices(servicesData: state.serviceModel.data![index],);
              },),

          );
        }
        else if(state is PopularServicesFailure){
          return Text(state.message);

        }
        else
        {return const Center(child: CircularProgressIndicator());}

      },
    );
  }
}
