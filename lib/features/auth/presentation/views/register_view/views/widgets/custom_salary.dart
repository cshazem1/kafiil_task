import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/theming/colors.dart';
import '../../../../../../../core/utils/theming/styles.dart';



class CustomSalary extends StatefulWidget {

  void Function() onTapR;
  void Function() onTapP;

  CustomSalary({
    super.key,
     required this.onTapR,
    required this.onTapP,

    this.salary=10,
  });
  int salary;

  @override
  State<CustomSalary> createState() => _CustomSalaryState();
}

class _CustomSalaryState extends State<CustomSalary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorManager.gray50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(
                      0, 3), // changes position of shadow
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 24.h,
              child: GestureDetector(

                onTap: widget.onTapR,
                child: Icon(
                  Icons.remove,
                  color: ColorManager.primary900,
                  weight: 20,
                  size: 32,
                ),
              ),
            ),
          ),
          Text(
            "SAR ${widget.salary}",
            style: TextStyles.font16Color800Gray500Weight
                .copyWith(fontSize: 16.sp),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(
                      0, 3), // changes position of shadow
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 24.h,
              child: GestureDetector(
                onTap: widget.onTapP,
                child: Icon(
                  Icons.add,
                  color: ColorManager.primary900,
                  weight: 20,
                  size: 32,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
