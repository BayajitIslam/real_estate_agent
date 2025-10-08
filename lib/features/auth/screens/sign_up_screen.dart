import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/auth/widgets/auth_background.dart';
import 'package:template/features/auth/widgets/auth_switch_text.dart';
import 'package:template/features/auth/widgets/custome_text_field.dart';
import 'package:template/features/auth/widgets/social_login_buttons.dart';
import 'package:template/routes/routes_name.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: AuthBackground(
        topPostion: 0.30.h,
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //<===================== Text =====================>
            Text(
              AppString.signUp,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            //<===================== Text =====================>
            SizedBox(height: 16.h),
            Text(
              AppString.weWillHelp,
              style: Theme.of(context).textTheme.bodySmall,
            ),

            //<=====================  Email TextField =====================>
            SizedBox(height: 40.h),
            CustomTextField(
              hintText: AppString.yourEmail,
              prefixIcon: Icons.email_outlined,
            ),

            //<===================== Password TextField  =====================>
            SizedBox(height: 16.h),
            CustomTextField(
              hintText: AppString.createPassword,
              prefixIcon: Icons.lock_outline,
              isPassword: true,
            ),

            //<===================== Button =====================>
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                //<=== Sign In Function Here ===>
              },
              child: Text(AppString.continueText),
            ),

            //<===================== Already have an account? sign in here =====================>
            SizedBox(height: 40.h),
            AuthSwitchText(
              text: AppString.allreadyHaveaccount,
              buttonText: AppString.signinHere,
              onTap: () {
                //<===================== Route Here  =====================>
                Get.toNamed(RoutesName.signin);
              },
            ),

            //<=====================  Google And Facebook =====================>
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //<=====================  Google =====================>
                SocialLoginButtons(
                  icon: AppImages.googleIcon,
                  onTap: () {
                    //<===== Google Login Function Here =====>
                  },
                ),
                //<=====================  Facebook =====================>
                SizedBox(width: 8.w),
                SocialLoginButtons(
                  icon: AppImages.facebookIcon,
                  onTap: () {
                    //<===== Facebook Login Function Here =====>
                  },
                ),
              ],
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
