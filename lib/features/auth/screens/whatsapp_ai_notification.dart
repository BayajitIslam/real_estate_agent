import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/auth/widgets/auth_background.dart';
import 'package:template/features/auth/widgets/custome_checkbox.dart';
import 'package:template/features/auth/widgets/phone_input_field.dart';
import 'package:template/routes/routes_name.dart';

class WhatsappAiNotification extends StatelessWidget {
  const WhatsappAiNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: AuthBackground(
        topPostion: 0.40,
        isSkipButton: true,
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //<===================== Text =====================>
            Text(
              AppString.whatsappAiNoti,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            //<===================== Text =====================>
            SizedBox(height: 16.h),
            Text(
              AppString.theMoreWeKnow,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            //<===================== Whast Number & Text Field =====================>
            //<===Whast Number Text ===>
            SizedBox(height: 40.h),
            Text(
              AppString.enterWhatsappNum,
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(fontSize: 16),
            ),

            //<===Whast Number Text Field ===>
            SizedBox(height: 16.h),
            PhoneInputField(),

            //<===================== Policy Checkbox And Text =====================>
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                //<======  Checkbox ======>
                CustomCheckbox(value: true, onChanged: (_) {}),

                //<======  Text  ======>
                SizedBox(width: 9.h),
                Expanded(
                  child: Text(
                    AppString.leoUlla,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: AppColors.bodyTextv1,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ],
            ),

            //<===================== Get Started Button =====================>
            SizedBox(height: 40.h),
            ElevatedButton(
              onPressed: () {
                //<===================== Route To Home ===========>
                Get.toNamed(RoutesName.home);
              },
              child: Text(AppString.getStarted),
            ),
          ],
        ),
      ),
    );
  }
}
