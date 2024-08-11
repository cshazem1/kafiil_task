import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kafiil_task/core/utils/theming/colors.dart';
import 'package:kafiil_task/features/countries/presentation/manager/country_country/country_cubit.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../../core/utils/theming/styles.dart';
import '../../../../../../../../core/widgets/custom_app_bar.dart';
import '../../../data/models/Country.dart';
import 'country_items.dart';
import 'custom_countries.dart';

class CountriesViewBody extends StatefulWidget {
  CountriesViewBody({super.key});

  final NumberPaginatorController controller = NumberPaginatorController();

  @override
  State<CountriesViewBody> createState() => _CountriesViewBodyState();
}

class _CountriesViewBodyState extends State<CountriesViewBody> {
  @override
  void initState() {
    print("lol");
    BlocProvider.of<CountryCubit>(context).getCountryIndex();
    super.initState();
  }
  Future<void> _refreshBalance() async {
    // Simulate a network request or other async operation
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      print("currentPage${currentPage}");
      BlocProvider.of<CountryCubit>(context)
          .getCountryIndex(
          quaryIndex: "?page=${(currentPage??0+1)}");   });
  }


  int? currentPage=0;
  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      onRefresh: _refreshBalance,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 82.spMin, right: 20.w),
        child: Column(
          children: [
            CustomAppBar(
              text: "Countries",onPressed: () {

              },),
            BlocBuilder<CountryCubit, CountryState>(
              builder: (context, state) {
                if (state is CountrySuccess) {
                  return CountryItems(countryModels: state.country,currentPage: (x) {
                    currentPage=x;
                  },);
                } else if (state is CountryFailure) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(state.message),
                          IconButton(icon: Icon(Icons.refresh),onPressed: () {
                            _refreshBalance();
                          },)
                        ],
                      ),

                    ],
                  );
                } else {
                  return Expanded(
                      child: Shimmer.fromColors(
                          loop: 0,
                          baseColor: Colors.white,
                          highlightColor: Colors.grey.withOpacity(.4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 28.h,
                              ),
                              SizedBox(
                                  height: 390.h,
                                  width: 334.w,
                                  child: Container(
                                    color: Colors.red,

                                  )),
                              SizedBox(
                                height: 28.h,
                              ),
                              SizedBox(
                                  height: 36.h,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 7,
                                    itemBuilder: (context, index) {
                                      if(index==4) {
                                        return const Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Text("...",style: TextStyle(color: Colors.black,fontSize: 22),),
                                        );
                                      } else {
                                        return SizedBox(width: 50,
                                          height: 20,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 12.0),
                                            child: Container(
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: Colors.black),
                                            ),
                                          ));
                                      }
                                    },
                                  )),
                            ],
                          )));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
