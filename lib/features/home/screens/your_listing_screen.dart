import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/home/controllers/your_listing_controller.dart';
import 'package:template/features/widgets/circle_button_with_border.dart';
import 'package:template/features/widgets/custom_search_bar.dart';
import 'package:template/features/home/widgets/empty_state.dart';
import 'package:template/features/home/widgets/listing_header.dart';
import 'package:template/features/home/widgets/property_card.dart';

class YourListingScreen extends GetView<YourListingController> {
  const YourListingScreen({super.key});

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
                    onTap:() {
                      //<===================== Filter Button Fuction =====================>
                    } ,
                  ),
                ],
              ),
            ),
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
