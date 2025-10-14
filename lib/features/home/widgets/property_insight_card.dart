import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';

class PropertyInsightCard extends StatelessWidget {
  const PropertyInsightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(top: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.propertyInsight,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 16.h),
          Column(
            children: [
              _buildInsightRow(
                context,
                AppString.negotiationRange,
                "€ 692,000",
              ),
              _buildInsightRow(
                context,
                AppString.negotiationRange,
                " \$410,000 – \$425,000",
              ),
              _buildInsightRow(context, AppString.basePrice, "Oct 1, 2025"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInsightRow(BuildContext context, String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(width: 1, color: AppColors.black10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              value,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
