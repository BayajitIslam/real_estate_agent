import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/profile/models/profile_model.dart';

class MyDetailsSection extends StatelessWidget {
  final ProfileModel profile;

  const MyDetailsSection({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.mydetails,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(height: 16.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: profile.bio.isNotEmpty
              ? Text(
                  profile.bio,
                  style: TextStyle(
                    color: AppColors.bodyTextv2,
                    fontSize: 14.sp,
                    height: 1.4,
                  ),
                )
              : Text(
                  AppString.yourBioHere,
                  style: TextStyle(
                    color: AppColors.bodyTextv2,
                    fontSize: 14.sp,
                    height: 1.4,
                  ),
                ),
        ),
      ],
    );
  }
}
