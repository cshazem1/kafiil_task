import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/service_located.dart';
import '../../../data/services_repo/services_repo_impl.dart';
import '../../manager/papular_services/popular_services_cubit.dart';
import '../../manager/services_cubit/services_cubit.dart';
import 'custom_card_Services.dart';
import 'custom_popular_service_widgets.dart';
import 'custom_service_widgets.dart';

class ServicesViewBody extends StatefulWidget {
  const ServicesViewBody({
    super.key,
  });

  @override
  State<ServicesViewBody> createState() => _ServicesViewBodyState();
}

class _ServicesViewBodyState extends State<ServicesViewBody> {
  Future<void> _refreshBalance() async {
    // Simulate a network request or other async operation
    await Future.delayed(const Duration(seconds: 2));

    setState(() {

      BlocProvider.of<ServicesCubit>(context)
          .fetchServices();
    BlocProvider.of<PopularServicesCubit>(context)
        .fetchPopularServices();});}


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh:_refreshBalance ,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 82.spMin, right: 20.w),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(text: "Services",onPressed: () => context.pop),
                SizedBox(
                  height: 32.h,
                ),
                const CustomServiceWidget(),
                SizedBox(
                  height: 32.h,
                ),
                CustomAppBar(text: "Popular Services",onPressed: () {

                },),
                SizedBox(
                  height: 32.h,
                ),

                const CustomPopularWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



