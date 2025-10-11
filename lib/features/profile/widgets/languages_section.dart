import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';

class LanguagesSection extends StatelessWidget {
  final List<String> languages;

  const LanguagesSection({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.languages,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(Icons.language, color: AppColors.bodyTextv2, size: 20.sp),
              SizedBox(width: 8.w),
              Text(
                languages.join(', '),
                style: TextStyle(
                  color: AppColors.bodyTextv2,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
