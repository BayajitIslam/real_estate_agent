import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home_work_outlined,
            size: 80.sp,
            color: AppColors.bodyTextv1,
          ),
          SizedBox(height: 16.h),
          Text(
            'No properties found',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Start adding your properties to see them here',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.bodyTextv1,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}