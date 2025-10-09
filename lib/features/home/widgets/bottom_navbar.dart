import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/features/home/controllers/navigation_controller.dart';

// Custom Bottom Navigation Bar Widget (Stateless with GetX)
class CustomBottomNavBar extends StatelessWidget {
  final String? profileImageUrl;

  const CustomBottomNavBar({super.key, this.profileImageUrl});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.find();

    return Container(
      decoration: const BoxDecoration(color: Colors.transparent),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavItem(
                  AppImages.homeIcon,
                  AppImages.homeOutlineIcon,
                  0,
                  navController,
                ),
                _buildNavItem(
                  AppImages.calendarIcon,
                  AppImages.calendarOutilineIcon,
                  1,
                  navController,
                ),
                _buildCenterFAB(),
                _buildNavItem(
                  AppImages.chatIcon,
                  AppImages.chatOutlineIcon,
                  2,
                  navController,
                ),
                _buildProfileIcon(3, navController),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    String activeIcon,
    String icon,
    int index,
    NavigationController controller,
  ) {
    final isSelected = controller.currentIndex.value == index;
    return GestureDetector(
      onTap: () => controller.changePage(index),
      child: Container(
        padding: EdgeInsets.all(12.w),
        child: isSelected
            ? SvgPicture.asset(activeIcon)
            : SvgPicture.asset(icon),
      ),
    );
  }

  Widget _buildCenterFAB() {
    return GestureDetector(
      onTap: () {
        //<================================== Choose story or add new property ==========================>
      },
      child: Container(
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: AppColors.buttonBgYellow,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.add, color: AppColors.black70, size: 24.sp),
      ),
    );
  }

  Widget _buildProfileIcon(int index, NavigationController controller) {
    final isSelected = controller.currentIndex.value == index;
    return GestureDetector(
      onTap: () => controller.changePage(index),
      child: Container(
        width: 24.w,
        height: 24.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? AppColors.buttonBackground : Colors.transparent,
            width: 1.w,
          ),
        ),
        child: CircleAvatar(
          radius: 20.r,
          backgroundColor: Colors.grey[300],
          backgroundImage: profileImageUrl != null
              ? NetworkImage(profileImageUrl!)
              : AssetImage(AppImages.defaultIcon),
        ),
      ),
    );
  }
}
