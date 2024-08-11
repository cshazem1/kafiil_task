import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:number_paginator/src/ui/widgets/paginator_content/number_content.dart';

import '../../../../../core/utils/theming/colors.dart';
import '../../../../../core/utils/theming/styles.dart';
import '../../../data/models/Country.dart';
import '../../manager/country_country/country_cubit.dart';
import 'custom_countries.dart';

class CountryItems extends StatefulWidget {
  CountryItems({super.key,required this.countryModels,required this.currentPage});
  final Country countryModels;
void Function(int x ) currentPage;
  @override
  State<CountryItems> createState() => _CountryItemsState();
}

class _CountryItemsState extends State<CountryItems> {

  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        SizedBox(
          height: 32.h,
        ),
        Container(
          height: 390.h,
          width: 334.w,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 20,
                  offset: const Offset(
                      0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(8.h))),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                  height: 40.h,
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10.w)),
                      color: ColorManager.gray50),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 2.h, horizontal: 40.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Country",
                          style: TextStyles
                              .font12Color900Gray600Weight,
                        ),
                        SizedBox(
                          width: 102.w,
                        ),
                        Text(
                          "Capital",
                          style: TextStyles
                              .font12Color900Gray600Weight,
                        )
                      ],
                    ),
                  )),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: widget.countryModels.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 45.w),
                          child: CustomCountries(
                            style: TextStyles
                                .font12Color900Gray500Weight,
                            country:
                            widget.countryModels.data![index].name!,
                            capital:
                            widget.countryModels.data![index].capital!,
                          ),
                        ),
                        index < widget.countryModels.data!.length - 1
                            ? Divider(
                          thickness: 1,
                          color: ColorManager.gray400,
                        )
                            : const SizedBox(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        SizedBox(
          height: 36.h,
          child: NumberPaginator(

            showPrevButton: true,
            showNextButton: true,
            initialPage: widget.countryModels.pagination!.currentPage!-1,
            numberPages: widget.countryModels.pagination!.totalPages!,
            // shows only default arrows, no center content of paginator
            config: NumberPaginatorUIConfig(
height: 50,
                buttonPadding: REdgeInsets.all(0),
                buttonUnselectedForegroundColor: Colors.black,
                buttonUnselectedBackgroundColor: Colors.white,
                buttonSelectedBackgroundColor:
                ColorManager.primary900,
                buttonShape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(7.h))),
                mode: ContentDisplayMode.numbers),
            onPageChange: (int index) {
              setState(() {
                BlocProvider.of<CountryCubit>(context)
                    .getCountryIndex(
                    quaryIndex: "?page=${index + 1}");
                widget.currentPage(index+1);

              });
            },
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
      ],
    );
  }
}