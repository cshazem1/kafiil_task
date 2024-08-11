import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/theming/colors.dart';
import '../../../../../../../core/utils/theming/styles.dart';


class Stepper1 extends StatelessWidget {
  bool onClickNext;
  Stepper1({
    required this.textName,
    super.key,
    required this.onClickNext,
  });
String textName;
  @override
  Widget build(BuildContext context) {
    return Stack(
clipBehavior: Clip.none,
      children: [
         Positioned(
            top: -24,
            left: -12,
            child: Text(textName,style: TextStyles.font12Color900Primary600Weight,)),
        Row(
          children: [
            Container(
              height: 25.h,
              width: 25.w,
              decoration: onClickNext
                  ? BoxDecoration(
                  border:
                  Border.all(color: ColorManager.primary900, width: 2.w),
                  color: Colors.white,
                  shape: BoxShape.circle)
                  : BoxDecoration(
                  color: ColorManager.primary900, shape: BoxShape.circle),
              child: Center(
                  child: onClickNext
                      ? Text(
                    "1",
                    style: TextStyles.font12Color900Primary600Weight,
                  )
                      : const Icon(
                    Icons.check,
                    color: Colors.white,
                  )),
            ),
            Container(
              width: 116.w,
              height: 2.h,
              decoration: BoxDecoration(
                color: onClickNext ? ColorManager.gray200 : ColorManager.primary900,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
