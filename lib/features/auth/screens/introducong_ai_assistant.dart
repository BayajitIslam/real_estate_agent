import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/auth/widgets/auth_background.dart';
import 'package:template/features/auth/widgets/feature_item.dart';
import 'package:template/routes/routes_name.dart';

class AiAssistant extends StatelessWidget {
  const AiAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: AuthBackground(
        topPostion: 0.13,
        imageHeight: 300,
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //<===================== Icon =====================>
            CircleAvatar(
              radius: 32.r,
              backgroundColor: AppColors.yellow,
              child: Icon(
                Icons.auto_awesome,
                size: 32,
                color: AppColors.black70,
              ),
            ),

            //<===================== Text =====================>
            SizedBox(height: 16.h),
            Text(
              AppString.aiAssistant,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            //<===================== Text =====================>
            SizedBox(height: 24.h),
            Text(
              AppString.letOurAiDo,
              style: Theme.of(context).textTheme.bodySmall,
            ),

            //<===================== Feature Item Card =====================>
            SizedBox(height: 24.h),
            Container(
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(24.r),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  FeatureItem(
                    title: AppString.instantReccomend,
                    description: AppString.noMoreEndless,
                  ),
                  SizedBox(height: 16.h),
                  FeatureItem(
                    title: AppString.instantReccomend,
                    description: AppString.noMoreEndless,
                  ),

                  SizedBox(height: 16.h),
                  FeatureItem(
                    title: AppString.instantReccomend,
                    description: AppString.noMoreEndless,
                  ),
                ],
              ),
            ),

            //<===================== Next Button =====================>
            SizedBox(height: 24.h),

            ElevatedButton(
              onPressed: () {
                //<===================== Route Whatsapp ai notification  =====================>
                Get.toNamed(RoutesName.whatsappAiNotification);
              },
              child: Text(AppString.next),
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
