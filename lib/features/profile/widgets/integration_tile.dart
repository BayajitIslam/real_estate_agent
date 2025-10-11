import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';

class IntegrationTile extends StatelessWidget {
  final VoidCallback onTap;

  const IntegrationTile({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        onTap: onTap,
        leading: SvgPicture.asset(AppImages.lineSegmentIcon),
        title: Text(
          AppString.integration,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: AppColors.bodyTextv1,
          size: 24.sp,
        ),
      ),
    );
  }
}
