import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/theming/styles.dart';

class CustomAppBar extends StatelessWidget {
   CustomAppBar({required this.onPressed,
    this.back=false,
    super.key, required this.text,
  });
    void Function()? onPressed;
  final String text;
  bool back=false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       back? GestureDetector(
         onTap:onPressed ,
         child: Icon(
            Icons.arrow_back_ios,
            weight: 8.w,
          ),
       ):const SizedBox(),
        Text(
          text,
          style: TextStyles.font18Color900Gray600Weight
              .copyWith(fontSize: 18.sp),
        ),
      ],
    );
  }
}
