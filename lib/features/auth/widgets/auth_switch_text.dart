import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';

class AuthSwitchText extends StatelessWidget {
  const AuthSwitchText({
    super.key,
    required this.buttonText,
    required this.onTap,
    required this.text,
  });

  final String text;
  final String buttonText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //<===================== Text =====================>
        Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(color: AppColors.bodyTextv2),
        ),

        //<===================== Text Button SignUP Here =====================>
        InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Text(
                buttonText,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: AppColors.black,
                  letterSpacing: 0,
                  height: 1,
                ),
              ),
              Container(height: 1, width: 75.h, color: AppColors.black),
            ],
          ),
        ),
      ],
    );
  }
}
