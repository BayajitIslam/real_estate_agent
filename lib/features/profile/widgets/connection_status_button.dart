import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';

class ConnectionStatusButton extends StatelessWidget {
  final bool isConnected;

  const ConnectionStatusButton({super.key, required this.isConnected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: isConnected ? AppColors.yellow : AppColors.background,
        borderRadius: BorderRadius.circular(111.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isConnected ? Icons.check : Icons.close,
            size: 12.sp,
            color: Colors.black87,
          ),
          SizedBox(width: 6.w),
          Text(
            isConnected ? AppString.connected : AppString.disconnected,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
