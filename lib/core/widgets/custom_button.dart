import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/theming/colors.dart';
import '../utils/theming/styles.dart';

class CustomButton extends StatelessWidget {
   CustomButton({this.buttonColor,
    super.key,
     this.onClick,
     required this.text
  });
 Function()? onClick;
 Color?buttonColor;
 String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 56.h,
        decoration: BoxDecoration(
            color:buttonColor?? ColorManager.primary900,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
              text,
              style:
              TextStyles.font14White500Weight.copyWith(fontSize: 14.sp),
            )),
      ),
    );
  }
}
