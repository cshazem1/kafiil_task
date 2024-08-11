import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil_task/core/service_located.dart';
import 'package:kafiil_task/features/services/data/services_repo/services_repo_impl.dart';
import 'package:kafiil_task/features/services/presentation/manager/services_cubit/services_cubit.dart';
import 'package:kafiil_task/features/services/presentation/manager/services_cubit/services_state.dart';

import 'custom_card_Services.dart';

class CustomServiceWidget extends StatefulWidget {
  const CustomServiceWidget({
    super.key,
  });

  @override
  State<CustomServiceWidget> createState() => _CustomServiceWidgetState();
}

class _CustomServiceWidgetState extends State<CustomServiceWidget> {
  @override
  void initState() {
    BlocProvider.of<ServicesCubit>(context).fetchServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesCubit, ServicesState>(
      builder: (context, state) {
if(state is ServicesSuccess) {
  return SizedBox(
          height: 192.h,
          child: ListView.builder(
            clipBehavior: Clip.none,
            itemCount: state.serviceModel.data?.length??0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return  CustomCardServices(servicesData: state.serviceModel.data![index],);
            },),

        );
}
else if(state is ServicesFailure){
  return Text(state.message);

}
else
  {return const Center(child: CircularProgressIndicator());}

      },
    );
  }
}
