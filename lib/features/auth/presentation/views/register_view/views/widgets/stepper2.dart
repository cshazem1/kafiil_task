import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/theming/colors.dart';
import '../../../../../../../core/utils/theming/styles.dart';

class Stepper2 extends StatelessWidget {
  bool onClickNext;
  Stepper2({
    required this.textName,
    super.key,
    required this.onClickNext,
  });
final String textName;
  @override
  Widget build(BuildContext context) {
    return Stack(
clipBehavior: Clip.none,
      children: [
        !onClickNext?   Positioned(
        top: -24,
        left: -24,
        child: Text(textName,style: TextStyles.font12Color900Primary600Weight,)):const SizedBox(),

        Row(
          children: [

            Container(
              height: 25.h,
              width: 25.w,
              decoration: onClickNext
                  ? BoxDecoration(
                  border: Border.all(color: ColorManager.gray200, width: 2.w),
                  color: ColorManager.gray200,
                  shape: BoxShape.circle)
                  : BoxDecoration(
                  border:
                  Border.all(color: ColorManager.primary900, width: 2.w),
                  color: Colors.white,
                  shape: BoxShape.circle),
              child: Center(
                  child: onClickNext
                      ? Text(
                    "",
                    style: TextStyles.font12Color900Primary600Weight,
                  )
                      : Text(
                    "2",
                    style: TextStyles.font12Color900Primary600Weight,
                  )),
            ),
            Container(
              width: 80.w,
              height: 2.h,
              decoration: BoxDecoration(
                color: ColorManager.gray200 ,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
