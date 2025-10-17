import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/home/controllers/your_listing_controller.dart';
import 'package:template/features/home/widgets/home_agent_story_card.dart';
import 'package:template/features/widgets/circle_button_with_border.dart';
import 'package:template/features/widgets/custom_search_bar.dart';
import 'package:template/features/home/widgets/empty_state.dart';
import 'package:template/features/home/widgets/listing_header.dart';
import 'package:template/features/home/widgets/property_card.dart';
import 'package:template/routes/routes_name.dart';

class YourListingScreen extends GetView<YourListingController> {
  const YourListingScreen({super.key});

  final bool isMyStory = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            //<===================== Header  =====================>
            const ListingHeader(),

            //<===================== Search Bar And Filter =====================>
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  SizedBox(
                    width: 275.w,
                    child: CustomSearchBar(
                      hintText: AppString.searchYourListing,
                      onChanged: controller.searchProperties,
                    ),
                  ),

                  //<===================== Filter Button =====================>
                  SizedBox(width: 12.h),
                  CircleButtonWithBorder(
                    onTap: () {
                      //<===================== Filter Button Fuction =====================>
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              height: 80.h, // total height of story section
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  // Create story
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 28.r,
                        backgroundColor: AppColors.buttonBackground,
                        child: SvgPicture.asset(AppImages.camaerIconOutline),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Create",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),

                  //if my story availabe
                  SizedBox(width: 12.w),
                  HomeAgentStoryCard(
                    image: AppImages.defaultIcon,
                    borderColor: AppColors.buttonBackground,
                    name: "You",
                    onPress: () {},
                  ),

                  // All other stories
                  ...List.generate(
                    10,
                    (index) => HomeAgentStoryCard(
                      image: AppImages.defaultIcon,
                      name: "Alice",
                      onPress: () {
                        Get.toNamed(RoutesName.propertyStoryScreen);
                      },
                    ),
                  ),
                ],
              ),
            ),

            //all listing
            SizedBox(height: 16.h),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.properties.isEmpty) {
                  return const EmptyState();
                }
                return RefreshIndicator(
                  onRefresh: controller.refreshProperties,
                  color: AppColors.buttonBackground,
                  backgroundColor: Colors.white,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: controller.properties.length,
                    itemBuilder: (context, index) {
                      return PropertyCard(
                        property: controller.properties[index],
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
