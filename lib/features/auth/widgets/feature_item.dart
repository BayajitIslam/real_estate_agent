import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_image_const.dart';

class FeatureItem extends StatelessWidget {
  final String title;
  final String description;

  const FeatureItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Circle icon
        Image.asset(AppImages.sealCheck, fit: BoxFit.cover),

        // Texts
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                description,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: AppColors.bodyTextv1,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
