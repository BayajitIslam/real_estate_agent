import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';

class BoostButton extends StatelessWidget {
  const BoostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //<=====================   Boost Button =====================>
        ElevatedButton.icon(
          onPressed: () {
            //<=====================   Boost Click Routing =====================>
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonBgYellow,
            foregroundColor: AppColors.black70,
            minimumSize: Size(90.w, 44.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(111.r),
            ),
            elevation: 0,
          ),
          icon: Icon(Icons.rocket_launch_outlined, size: 16.sp),
          label: Text(
            AppString.boost,
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(fontSize: 14.sp),
          ),
        ),

        //<=====================   More Button =====================>
        GestureDetector(
          onTap: () {
            //<=====================   More Routing =====================>
          },
          child: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.transparent,
            child: Icon(Icons.more_horiz, size: 16.sp),
          ),
        ),
      ],
    );
  }
}
