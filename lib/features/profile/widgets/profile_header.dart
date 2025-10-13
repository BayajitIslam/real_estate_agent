import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/profile/models/profile_model.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileModel profile;

  const ProfileHeader({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          // Profile Image
          Stack(
            children: [
              CircleAvatar(
                radius: 85.r,
                backgroundImage: (profile.avatar.isNotEmpty)
                    ? NetworkImage(profile.avatar)
                    : AssetImage(AppImages.defaultIcon) as ImageProvider,
              ),
              if (profile.isSuperAgent)
                Positioned(
                  bottom: 0,
                  left: 25,
                  right: 25,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.buttonBgYellow,
                      gradient: LinearGradient(
                        begin: AlignmentGeometry.topCenter,
                        end: AlignmentGeometry.bottomCenter,
                        colors: [AppColors.yellow, AppColors.orange],
                      ),
                      border: Border.all(
                        color: AppColors.buttonBgYellow,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(111.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppImages.kingIcon, fit: BoxFit.cover),
                        SizedBox(width: 4.w),
                        Text(
                          AppString.superAgent,
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(
                                color: AppColors.black,
                                fontSize: 14,
                                height: 1,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 16.h),

          // Name
          Text(
            profile.name,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),

          // Location
          Text(
            profile.location,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(color: AppColors.bodyTextv1),
          ),
        ],
      ),
    );
  }
}
