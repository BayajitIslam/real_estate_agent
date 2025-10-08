import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/auth/widgets/auth_background.dart';
import 'package:template/routes/routes_name.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: AuthBackground(
        bgImage: AppImages.authBackgroundV1,
        imageHeight: 523,
        widget: Column(
          children: [
            //<===================== Text =====================>
            Text(
              AppString.findYourDream,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            //<===================== Text =====================>
            SizedBox(height: 16.h),
            Text(
              AppString.discoverHome,
              style: Theme.of(context).textTheme.bodySmall,
            ),

            //<===================== Button =====================>
            SizedBox(height: 19.h),
            ElevatedButton(
              //<=== Route To Sign In Screeen ====>
              onPressed: () {
                Get.toNamed(RoutesName.signin);
              },
              child: Text(AppString.getStarted),
            ),

            //<===================== Text =====================>
            SizedBox(height: 19.h),
            Text(
              AppString.takeYourFirst,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(fontSize: 14.sp, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}
