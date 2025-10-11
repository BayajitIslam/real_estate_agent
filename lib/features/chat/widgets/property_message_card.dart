import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/features/chat/models/property_message_model';

class PropertyMessageCard extends StatelessWidget {
  final PropertyMessageModel property;

  const PropertyMessageCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 309.w,
      height: 139.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Property Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(
                  property.imageUrl,
                  width: 71.w,
                  height: 71.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),

              // Property Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.title,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.black,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      property.price,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.black,
                        height: 1.2,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0,
                      ),
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            ],
          ),
          //
          SizedBox(height: 12.h),
          Container(
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(16.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.w),
            child: Row(
              children: [
                _buildFeature(AppImages.bedIcon, property.bedrooms),
                SizedBox(width: 4.w),
                CircleAvatar(
                  radius: 2.r,
                  backgroundColor: AppColors.textFieldBorder,
                ),
                SizedBox(width: 4.w),
                _buildFeature(AppImages.rulerIcon, property.area),
                SizedBox(width: 4.w),
                CircleAvatar(
                  radius: 2.r,
                  backgroundColor: AppColors.textFieldBorder,
                ),
                SizedBox(width: 4.w),
                _buildFeature(AppImages.stackSimpleIcon, property.floors),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeature(String icon, String text) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        SizedBox(width: 4.w),
        Text(
          text,
          style: TextStyle(color: AppColors.bodyTextv2, fontSize: 14.sp),
        ),
      ],
    );
  }
}
