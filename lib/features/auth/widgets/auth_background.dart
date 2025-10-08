import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/auth/widgets/custom_button.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({
    super.key,
    required this.widget,
    this.isSkipButton = false,
    this.topPostion = 0.57,
    this.bgImage = AppImages.authBackgroundV2,
    this.imageHeight = 389
  });

  final Widget widget;
  final bool isSkipButton;
  final double topPostion;
  final String bgImage;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox.expand(),
        //<===================== Background Image =====================>
        Positioned(
          child: Container(
            height: imageHeight.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bgImage),
                fit: BoxFit.cover,
              ),
            ),

            //<===================== Appbar  =====================>
            child: SafeArea(
              maintainBottomViewPadding: true,
              minimum: EdgeInsets.only(top: 12.h, left: 14.w, right: 17.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //<===================== Logo Here =====================>
                  Image.asset(AppImages.realEstateLogo, fit: BoxFit.cover),

                  //<===================== Skip Button If Need =====================>
                  isSkipButton
                      ? SizedBox(
                          height: 40.h,
                          width: 80.w,
                          child: CustomeSkipButton(
                            text: AppString.skip,
                            onPressed: () {},
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),

        //<===================== White Card =====================>
        Positioned(
          top: topPostion.sh,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
              color: AppColors.cardBackground,
            ),
            padding: EdgeInsets.only(
              top: 32.h,
              right: 16.w,
              left: 16.w,
              bottom: 24.h,
            ),

            //<===================== Return Widget =====================>
            child: widget,
          ),
        ),
      ],
    );
  }
}
