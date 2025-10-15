import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';

class DottedBorderBox extends StatelessWidget {
  const DottedBorderBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 16.w,
            height: 16.h,
            child: SvgPicture.asset(AppImages.mediaIcon, fit: BoxFit.cover),
          ),

          SizedBox(height: 8.h),
          Text(
            AppString.addMedia,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
