import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/theming/colors.dart';
import '../../../../../../../core/utils/theming/styles.dart';



class LinkedLabelRadio extends StatelessWidget {
  const LinkedLabelRadio({
    super.key,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });
  final EdgeInsets padding;
  final String groupValue;
  final String value;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right:30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: 20.w,
            child: Radio<String>(

              activeColor: ColorManager.primary900,
              focusColor: ColorManager.primary900,
              groupValue: groupValue,
              value: value,
              onChanged:(value) {
                onChanged(value);

              },
            ),
          ),
          SizedBox(width: 8.w,),
          RichText(
            text: TextSpan(
              text: value,
              style:TextStyles.font14White500Weight.copyWith(color: Colors.black),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  debugPrint('Label has been tapped.');
                },
            ),
          ),
        ],
      ),
    );
  }
}
