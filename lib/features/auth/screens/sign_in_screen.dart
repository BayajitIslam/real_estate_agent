import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/auth/controllers/sign_in_controller.dart';
import 'package:template/features/auth/widgets/auth_background.dart';
import 'package:template/features/auth/widgets/auth_switch_text.dart';
import 'package:template/features/auth/widgets/custome_text_field.dart';
import 'package:template/features/auth/widgets/social_login_buttons.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: AuthBackground(
        topPostion: 0.40.h,
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //<===================== Text =====================>
            Text(
              AppString.signIn,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            //<===================== Text =====================>
            SizedBox(height: 16.h),
            Text(
              AppString.weWillHelp,
              style: Theme.of(context).textTheme.bodySmall,
            ),

            //<=====================  Email TextField =====================>
            SizedBox(height: 16.h),
            CustomTextField(
              hintText: AppString.yourEmail,
              prefixIcon: Icons.email_outlined,
            ),

            //<===================== Password TextField  =====================>
            SizedBox(height: 8.h),
            CustomTextField(
              hintText: AppString.createPassword,
              prefixIcon: Icons.lock_outline,
              isPassword: true,
            ),

            //<===================== Button =====================>
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                //<=== Sign In Function Here ===>
              },
              child: Text(AppString.continueText),
            ),

            //<===================== Don’t have an account? sign up here =====================>
            SizedBox(height: 16.h),
            AuthSwitchText(
              text: AppString.dontHaveAccount,
              buttonText: AppString.signUpHere,
              onTap: () {
                //<===================== Route Here  =====================>
              },
            ),

            //<=====================  Google And Facebook =====================>
            SizedBox(height: 16.h),
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
