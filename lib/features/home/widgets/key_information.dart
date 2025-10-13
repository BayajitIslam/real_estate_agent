import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/home/models/property_model.dart';

class KeyInformation extends StatelessWidget {
  KeyInformation({super.key});

  final PropertyModel argument = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24.r),
      ),
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(top: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.keyInformation,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          Text(
            AppString.infoNecessaryTocreate,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 14.sp,
              color: AppColors.bodyTextv2,
            ),
          ),
          SizedBox(height: 16.h),
          Column(
            children: [
              _buildInfoRow(context, AppString.address, argument.address),
              _buildInfoRow(
                context,
                AppString.city,
                argument.city,
                AppString.zipCode,
                argument.city,
              ),
              _buildInfoRow(
                context,
                AppString.state,
                argument.state,
                AppString.country,
                argument.country,
              ),
              _buildInfoRow(
                context,
                AppString.salesPrice,
                argument.formattedPrice,
              ),
            ],
          ),

          Row(
            children: [
              const Icon(Icons.info_rounded, size: 24, color: AppColors.black),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  AppString.thisListingIsOnLYThisPlatform,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    String label1,
    String value1, [
    String? label2,
    String? value2,
  ]) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label1,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value1,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
          if (label2 != null && value2 != null)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label2,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    value2,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
