import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/features/chat/models/message_model.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isSentByMe
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        constraints: BoxConstraints(maxWidth: 280.w),
        decoration: BoxDecoration(
          color: message.isSentByMe
              ? AppColors.buttonBackground
              : AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
            bottomRight: message.isSentByMe
                ? Radius.circular(16.r)
                : Radius.zero,
            bottomLeft: message.isSentByMe
                ? Radius.zero
                : Radius.circular(16.r),
          ),
        ),
        child: Text(
          message.text,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: AppColors.black,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
