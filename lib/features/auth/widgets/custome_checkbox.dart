import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color borderColor;
  final double size;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = AppColors.yellow,
    this.borderColor = Colors.grey,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: size.h,
        width: size.h,
        decoration: BoxDecoration(
          color: value ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            color: value ? activeColor : borderColor,
            width: 1.8,
          ),
        ),
        child: value
            ? Icon(
                Icons.check,
                fontWeight: FontWeight.w400,
                size: (size * 0.8).sp,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
