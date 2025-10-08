import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeSkipButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Gradient gradient;
  final Color borderColor;
  final double borderWidth;
  final TextStyle? textStyle;

  const CustomeSkipButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.gradient = const LinearGradient(
      colors: [Color(0xFF4c4f42), Color(0xFF7996a3)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    this.borderColor = Colors.white,
    this.borderWidth = 0.5,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onPressed,
      child: Container(
        width: 75.w,
        height: 35.h,
        decoration: BoxDecoration(
          gradient: gradient, // 🔹 background gradient
          borderRadius: BorderRadius.circular(36.r),
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ), // 🔹 border
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style:
                textStyle ??
                Theme.of(context).textTheme.labelMedium!.copyWith(),
          ),
        ),
      ),
    );
  }
}
