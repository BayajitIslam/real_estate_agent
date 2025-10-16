import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';

class IncrementDecrementField extends StatefulWidget {
  const IncrementDecrementField({
    super.key,
    this.textfieldText = AppString.amount,
    required this.title,
  });

  final String textfieldText;
  final String title;

  @override
  State<IncrementDecrementField> createState() =>
      _IncrementDecrementFieldState();
}

class _IncrementDecrementFieldState extends State<IncrementDecrementField> {
  int amount = 0;

  void _increase() {
    setState(() {
      amount++;
    });
  }

  void _decrease() {
    if (amount > 0) {
      setState(() {
        amount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          height: 48.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.black10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                amount == 0 ? widget.textfieldText : amount.toString(),
                style: TextStyle(
                  color: amount == 0 ? Colors.grey.shade500 : Colors.black,
                  fontSize: 16,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: _increase,
                    child: const Icon(
                      Icons.keyboard_arrow_up,
                      color: AppColors.black,
                      size: 16,
                    ),
                  ),
                  InkWell(
                    onTap: _decrease,
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.black,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
