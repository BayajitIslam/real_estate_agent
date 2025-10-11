import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/chat/models/message_model.dart';
import 'package:template/features/chat/models/property_message_model';
import 'package:template/features/chat/widgets/message_bubble.dart';
import 'package:template/features/chat/widgets/property_message_card.dart';
import 'package:template/features/widgets/circle_button_with_border.dart';

class ChatConversationScreen extends StatelessWidget {
  ChatConversationScreen({super.key});

  final chat = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final messages = _getSampleMessages();
    final property = _getSampleProperty();

    return Scaffold(
      backgroundColor: AppColors.cardBackground,
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        leadingWidth: 70.w,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: CircleButtonWithBorder(
            onTap: () => Get.back(),
            radius: 20,
            isIcon: true,
            icon: Icons.arrow_back_outlined,
          ),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundImage: NetworkImage(chat.avatar),
            ),
            SizedBox(width: 11.w),
            Text(
              chat.name,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.black),
            ),
          ],
        ),
        actions: [
          CircleButtonWithBorder(
            onTap: () {
              //<===================== More Button Function =====================>
            },
            isIcon: true,
            icon: Icons.more_horiz,
            radius: 22,
          ),
          SizedBox(width: 24.w),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property Card
          PropertyMessageCard(property: property),

          // Messages
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(message: messages[index]);
              },
            ),
          ),

          // Input Field
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: AppColors.buttonBackground),
                    ),
                    hintText: AppString.enterMessage,
                    hintStyle: TextStyle(
                      color: AppColors.bodyTextv1,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: AppColors.black10,
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: AppColors.buttonBackground,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                AppImages.sendMessageIcon,
                fit: BoxFit.scaleDown,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<MessageModel> _getSampleMessages() {
    return [
      MessageModel(
        id: '1',
        text: 'this place looks beautiful! Is it still available?',
        isSentByMe: false,
        time: '9:41',
      ),
      MessageModel(
        id: '2',
        text:
            'Hi there! 👋 Yes, it\'s still available. It\'s a 3-bedroom flat, 60.5m², located on the 2nd floor. Are you looking to buy for yourself or as an investment?',
        isSentByMe: true,
        time: '9:42',
      ),
      MessageModel(
        id: '3',
        text:
            'Mostly for investment, but I might live in it for a while too. The price is €692,000 — is that negotiable?',
        isSentByMe: false,
        time: '9:43',
      ),
      MessageModel(
        id: '4',
        text:
            'Great plan! The price is slightly negotiable depending on the offer. The unit is fully renovated and located in a very sought-after area, which helps with both appreciation and rental...',
        isSentByMe: true,
        time: '9:45',
      ),
    ];
  }

  PropertyMessageModel _getSampleProperty() {
    return PropertyMessageModel(
      title: 'Flat / apartment for sale in plaza España, 12',
      price: '€692,000',
      imageUrl:
          'https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=400',
      bedrooms: '3 bedroom',
      area: '60.5m2',
      floors: '2 Floor',
    );
  }
}
