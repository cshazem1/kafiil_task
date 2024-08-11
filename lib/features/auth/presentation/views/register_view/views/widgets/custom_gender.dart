import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil_task/features/auth/presentation/views/register_view/views/widgets/radio_label.dart';

import '../../../../../../../core/utils/theming/styles.dart';



class Gender extends StatefulWidget {
   Gender({required this.onChanged,this.type,
    super.key,
  });
  void Function(String?) onChanged;
  String ?type;
  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String groupValue = "0";

  @override
  Widget build(BuildContext context) {
    widget.type=='0'?groupValue="Male":groupValue="Female";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style:
          TextStyles.font12ColorGray500500Weight.copyWith(fontSize: 12.sp),
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LinkedLabelRadio(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              value: "Male",
              groupValue: groupValue,
              onChanged: widget.onChanged
            ),
            LinkedLabelRadio(

              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              value: "Female",
              groupValue: groupValue,
              onChanged: widget.onChanged
            ),
          ],
        ),
      ],
    );
  }
}