import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCountries extends StatelessWidget {
  const CustomCountries({
    this.style,
    required this.capital,
    required this.country,
    super.key,
  });
  final String country;
  final String capital;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              country,
              style: style!.copyWith(overflow: TextOverflow.ellipsis),
            ),
          ),
          SizedBox(width: 102.w,),
          Expanded(
            child: Text(
              capital,
              style: style!.copyWith(overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}
