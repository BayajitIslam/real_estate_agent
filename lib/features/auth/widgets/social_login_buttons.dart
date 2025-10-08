import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({
    super.key,
    required this.onTap,
    required this.icon,
  });

  final void Function()? onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56.w,
        height: 56.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.socialCardBorder),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Image.asset(icon),
      ),
    );
  }
}
