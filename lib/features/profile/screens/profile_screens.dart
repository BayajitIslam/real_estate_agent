import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/profile/controllers/profile_controller.dart';
import 'package:template/features/profile/widgets/average_rating_section.dart';
import 'package:template/features/profile/widgets/integration_tile.dart';
import 'package:template/features/profile/widgets/languages_section.dart';
import 'package:template/features/profile/widgets/my_details_section.dart';
import 'package:template/features/profile/widgets/profile_header.dart';
import 'package:template/features/profile/widgets/statistics_section.dart';
import 'package:template/features/widgets/circle_button_with_border.dart';
import 'package:template/routes/routes_name.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        elevation: 0,
        title: Text(
          AppString.profile,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          CircleButtonWithBorder(
            isIcon: true,
            icon: Icons.settings_outlined,
            onTap: () {},
          ),
          SizedBox(width: 16.h),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.buttonBackground),
          );
        }

        if (controller.profile.value == null) {
          return const Center(child: Text('No profile data'));
        }

        final profile = controller.profile.value!;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // Profile Header Section
                ProfileHeader(profile: profile),

                SizedBox(height: 16.h),

                // Edit Profile Button
                OutlinedButton(
                  onPressed: controller.editProfile,
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

                SizedBox(height: 16.h),

                // Integration Button
                IntegrationTile(
                  onTap: () {
                    Get.toNamed(RoutesName.integrationScreen);
                  },
                ),

                SizedBox(height: 24.h),

                // My Details Section
                MyDetailsSection(profile: profile),

                SizedBox(height: 24.h),

                // Average Rating
                AverageRatingSection(rating: profile.rating),

                SizedBox(height: 24.h),

                // Languages
                LanguagesSection(languages: profile.languages),

                SizedBox(height: 24.h),

                // Statistics
                StatisticsSection(profile: profile),

                SizedBox(height: 100.h), // Bottom padding for navbar
              ],
            ),
          ),
        );
      }),
    );
  }
}
