import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/home/models/property_model.dart';

class MediaSection extends StatelessWidget {
  MediaSection({super.key});

  final argument = Get.arguments as PropertyModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24.4),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.media,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 16.h),
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 149 / 119,
            ),
            itemCount: argument.imageUrl.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Container(
                  width: 149.w,
                  height: 119.h,
                  color: AppColors.cardBackground,
                  child: Image.network(
                    argument.imageUrl[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.cardBackground,
                        child: const Icon(Icons.image, size: 40),
                      );
                    },
                  ),
                ),
              );
            },
          ),

          //delet and edit button
          SizedBox(height: 16.h),
          Row(
            children: [
              //delet
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.red10,
                child: SvgPicture.asset(AppImages.deletIcon),
              ),

              //edit button
              SizedBox(width: 12.w),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    //go to edit profile pages
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.infinity, 48.h),
                    side: BorderSide(color: AppColors.black10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(111.r),
                    ),
                  ),
                  child: Text(
                    AppString.editProfile,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
