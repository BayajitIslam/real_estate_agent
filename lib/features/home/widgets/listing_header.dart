import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/home/controllers/your_listing_controller.dart';

class ListingHeader extends GetView<YourListingController> {
  const ListingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.yourListing,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(height: 4.h),
              Obx(
                () => Text(
                  '${controller.activeListings.value} ${AppString.active}',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              //<===================== Click Button =====================>
            },
            child: CircleAvatar(
              radius: 24.r,
              backgroundColor: AppColors.buttonBackground,
              child: SvgPicture.asset(AppImages.camaraIcon,fit: BoxFit.cover,)
            ),
          ),
        ],
      ),
    );
  }
}
