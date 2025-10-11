import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/features/chat/models/chat_model.dart';
import 'package:template/routes/routes_name.dart';

class ChatListTile extends StatelessWidget {
  final ChatModel chat;

  const ChatListTile({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RoutesName.chatConversation, arguments: chat);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Row(
          children: [
            // Avatar with online indicator
            Stack(
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundImage: NetworkImage(chat.avatar),
                ),
                if (chat.isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.cardBackground,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 12.w),

            // Name and message
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.name,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    chat.lastMessage,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(fontSize: 14.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
              SizedBox(width: 12.w),

              //More Info
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.more_horiz,size: 16.sp,color: AppColors.bodyTextv2,),
              ),

            // Time and unread count
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (chat.unreadCount > 0)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.buttonBgYellow,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      '${chat.unreadCount}',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
