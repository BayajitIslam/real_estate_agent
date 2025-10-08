import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';

class PhoneInputField extends StatefulWidget {
  const PhoneInputField({super.key});

  @override
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  String selectedCode = '+123';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          // phone icon
          Icon(Icons.phone_outlined, color: Colors.grey, size: 20.sp),

          SizedBox(width: 8.w),

          // country code dropdown
          DropdownButton<String>(
            value: selectedCode,
            underline: const SizedBox(),
            icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
            items: [
              DropdownMenuItem(
                value: '+123',
                child: Text(
                  '+123',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.bodyTextv1,
                    letterSpacing: 0,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: '+11',
                child: Text(
                  '+11',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.bodyTextv1,
                    letterSpacing: 0,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: '+880',
                child: Text(
                  '+880',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.bodyTextv1,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedCode = value!;
              });
            },
          ),

          // divider
          Container(
            height: 24.h,
            width: 1,
            color: Colors.grey.shade300,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
          ),

          // city text field
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: AppString.sanFrancisco,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
