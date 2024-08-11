import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/utils/assets.dart';
import '../../../../../../../core/utils/theming/colors.dart';
import '../../../../../../../core/utils/theming/styles.dart';
import '../../../../../data/models/dependencies_models/SocialMedia.dart';

class CustomCheckBoxFavourite extends StatefulWidget {
  List<dynamic>? select;
  final SocialMedia socialMedia;
  final void Function(String, bool) favoriteSelect;

  CustomCheckBoxFavourite({
    required this.favoriteSelect,
    this.select,
    required this.socialMedia,
    super.key,
  });

  @override
  State<CustomCheckBoxFavourite> createState() =>
      _CustomCheckBoxFavouriteState();
}
Map favorite={"facebook":AssetsData.facebookIcon,"x":AssetsData.twitterIcon,'instagram':AssetsData.instagram};
class _CustomCheckBoxFavouriteState extends State<CustomCheckBoxFavourite> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    if (widget.select != null) {
      for (dynamic i in widget.select!) {
        if (widget.socialMedia.value == i) {
          _value = true;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: ColorManager.primary900,
          value: _value,
          onChanged: (change) {
            _value = change!;
            setState(() {
              widget.favoriteSelect(widget.socialMedia.value!, _value);
            });
          },
        ),
        ClipOval(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset(
                favorite[widget.socialMedia.label!.toLowerCase()],
                height: 25.h,
                width: 25.w,
              ),
              const SizedBox(),
            ],
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(
          widget.socialMedia.label!,
          style: TextStyles.font14Color900Gray500Weight.copyWith(fontSize: 15),
        )
      ],
    );
  }
}
