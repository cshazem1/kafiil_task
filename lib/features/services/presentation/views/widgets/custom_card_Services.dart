import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/theming/colors.dart';
import '../../../../../core/utils/theming/styles.dart';
import '../../../data/services_model/Data.dart';

class CustomCardServices extends StatelessWidget {
  final ServicesData servicesData;
  const CustomCardServices({
    required this.servicesData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 1.5.h),
        height: 192.h,
        width: 157.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.sp),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 20,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [

                Container(
                  height: 103.h,
                  width: 151.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                   ),
                  child: servicesData.mainImage!.isNotEmpty?CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: servicesData.mainImage!,
                    placeholder: (context, url) => Shimmer(child: Container(color: Colors.black,), gradient: const LinearGradient(colors: [
                      Colors.white70,
                      Colors.blue
                    ])),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ):Image.asset(AssetsData.product),
                ),
                Positioned(
                  bottom: 6,
                  left: 6,
                  child: Container(
                    width: 60.w,
                    height: 26.h,
                    decoration: BoxDecoration(
                        color: ColorManager.primary900,
                        borderRadius: BorderRadius.circular(26.sp)),
                    child: Center(
                        child: Text(
                      "\$${servicesData.price}",
                      style: TextStyles.font12Color900BgGrey500Weight,
                    )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                textAlign: TextAlign.right,

                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                "${servicesData.title}",
                style: TextStyles.font11Color900Gray500Weight.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: ColorManager.warning,
                  size: 18,
                ),
                SizedBox(width: 4.w),
                Text(
                  "(${servicesData.averageRating})",
                  style: TextStyles.font11ColorWarning400Weight
                      .copyWith(fontSize: 14.sp),
                ),
                SizedBox(
                    width: 4.w),
                SizedBox(
                  height: 18.h,
                  child: VerticalDivider(
                    color: ColorManager.gray300,
                    thickness: 1,
                    width: 1,
                    indent: 3.h,
                    endIndent: 3.h,
                  ),
                ),
                SizedBox(
                    width:
                        4.w),

                SvgPicture.asset("assets/images/svg/cart.svg"),
                SizedBox(
                    width:
                        4.w),
                Text(
                  "${servicesData.completedSalesCount}",
                  style: TextStyles.font10Color900Gray400Weight,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
