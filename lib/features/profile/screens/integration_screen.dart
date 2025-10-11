import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/widgets/circle_button_with_border.dart';
import 'package:template/features/widgets/custom_search_bar.dart';

class IntegrationScreen extends StatelessWidget {
  const IntegrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70.w,
        leading: CircleButtonWithBorder(
          isIcon: true,
          icon: Icons.arrow_back,
          onTap: Get.back,
        ),
        title: Text(
          AppString.integration,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 16.sp,
            height: 1.2,
            letterSpacing: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 16),

            //Custome Search
            CustomSearchBar(
              hintText: AppString.searchPlatform,
              onChanged: (_) {},
            ),

            //
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //icon and connected
                  Row(
                    children: [
                      Container(
                        height: 48.h,
                        width: 48.w,
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          AppImages.googleSvgIcon,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),

                  //platform name
                  SizedBox(height: 16.h),
                  Text(
                    AppString.facebook,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      height: 1,
                      letterSpacing: 0,
                    ),
                  ),

                  //desctiption
                  SizedBox(height: 12.h),
                  Text(
                    AppString.accesAnsShare,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.bodyTextv2,
                      fontSize: 12.sp,
                      height: 1,
                      letterSpacing: 0,
                    ),
                  ),

                  //connected disconcceted
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
