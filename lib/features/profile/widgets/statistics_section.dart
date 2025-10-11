import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/profile/models/profile_model.dart';

class StatisticsSection extends StatelessWidget {
  final ProfileModel profile;

  const StatisticsSection({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                icon: AppImages.homeProfileIcon,
                label: AppString.amountOfList,
                value: profile.amountOfListing.toString(),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                icon: AppImages.tagIcon,
                label: AppString.propertiesSold,
                value: profile.propertiesSold.toString(),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildStatCard(
                icon: AppImages.circleDashedIcon,
                label: AppString.storyUploaded,
                value: profile.storyUploaded.toString(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(icon),
          SizedBox(height: 8.h),
          Text(
            label,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
