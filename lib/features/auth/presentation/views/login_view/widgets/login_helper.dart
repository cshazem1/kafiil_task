import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil_task/core/utils/theming/colors.dart';

import '../../../../../../core/utils/theming/styles.dart';



class LoginHelper extends StatefulWidget {

  LoginHelper({
    super.key,
  });
  bool onClickCheckBox=false;

  @override
  State<LoginHelper> createState() => _LoginHelperState();
}

class _LoginHelperState extends State<LoginHelper> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width*.89,
      height: 17.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Checkbox(

              value: widget.onClickCheckBox, onChanged: (value) {
              setState(() {
                widget.onClickCheckBox=!widget.onClickCheckBox;

              });
            },
              activeColor: ColorManager.primary900,
            ),
            Text("Remember me",style: TextStyles.font12ColorGray500500Weight,)
          ],),
          Text("Forgot Password?",style: TextStyles.font12ColorGray500500Weight,)
        ],
      ),
    );
  }
}