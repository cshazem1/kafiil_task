import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/theming/colors.dart';

import '../utils/theming/styles.dart';

class CustomTextField extends StatefulWidget {
  final String ? initialValue;
  final bool password;
  final String textName;
  final double? height;
  final bool validation;
  TextEditingController? controller;
  CustomTextField({
    this.controller,
    this.validation=true,
    this.initialValue,
    this.height,
    required this.textName,
    super.key,
    required this.password,
    this.onClickEyePassword=false
    ,
     required this.onChanged
  });
  bool onClickEyePassword ;
  void Function(String) onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          widget.textName,
          style: TextStyles.font12ColorGray500500Weight
              .copyWith(fontSize: 12.sp),
        ),
        SizedBox(height: 8.h,),
        TextFormField(
          controller:widget.controller ,
          onChanged:widget.onChanged ,
          validator: (value) {

         if ((value?.isEmpty ?? true)) {
           if(widget.validation) {
             return "field is required";
           } else {
             return "";
           }
            } else {
              return null;
            }
          },
          initialValue: widget.initialValue,
          maxLines:widget.textName=="About"? 4:1,

          obscureText: widget.password ? !widget.onClickEyePassword : false,
          decoration: InputDecoration(
              suffixIcon: widget.password
                  ? GestureDetector(
                onTap: () {
                  setState(() {
                    widget.onClickEyePassword = !widget.onClickEyePassword;
                  });
                },
                child: Padding(
                  padding:  EdgeInsets.only(right: 8.0.w,top: 12.h),
                  child: widget.onClickEyePassword
                      ? FaIcon(
                    FontAwesomeIcons.eye,
                    color: ColorManager.gray400,
                    size: 18,
                  )
                      : FaIcon(
                    FontAwesomeIcons.eyeSlash,
                    color: ColorManager.gray400,
                    size: 18,
                  ),
                ),
              )
                  : const SizedBox(),
              filled: true,
              fillColor: ColorManager.gray50,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              border:OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(16)) ,
              errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(16)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(16))),
        ),
      ],
    );
  }
}