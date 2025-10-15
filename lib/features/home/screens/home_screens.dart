import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/calendar/screens/calendar_screens.dart';
import 'package:template/features/chat/screens/chat_list_screens.dart';
import 'package:template/features/home/bindings/home_content_binding.dart';
import 'package:template/features/home/controllers/navigation_controller.dart';
import 'package:template/features/home/screens/your_listing_screen.dart';
import 'package:template/features/home/widgets/bottom_navbar.dart';
import 'package:template/features/profile/screens/profile_screens.dart';
import 'package:template/routes/routes_name.dart';

class HomeScreen extends GetView<YourListingBinding> {
  HomeScreen({super.key});

  NavigationController get navController => Get.find<NavigationController>();

  final List<Widget> pages = [
    const YourListingScreen(),
    const CalendarScreens(),
    const ChatListScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[navController.currentIndex.value]),
      bottomNavigationBar: CustomBottomNavBar(
        onTap: () {
          navController.setBottomSheetState(true); // mark bottom sheet open
          //show bottom sheet
          showModalBottomSheet(
            context: context,
            barrierColor: Colors.transparent,
            backgroundColor: Colors.transparent, // important!
            isScrollControlled: true,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: 92.h, // space for BottomNavBar height
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(
                          0.08,
                        ), // light black shadow
                        blurRadius: 20, // softness
                        spreadRadius: 0,
                        offset: const Offset(0, -12), //upward shadow (top side)
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                      horizontal: 16.w,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //
                        Container(
                          width: 63.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: AppColors.grey100,
                            borderRadius: BorderRadius.circular(11.r),
                          ),
                        ),

                        //NEW LISTING
                        SizedBox(height: 16.h),
                        ElevatedButton.icon(
                          onPressed: () {
                            //<=====================   New Listing Routing =====================>
                            Get.toNamed(RoutesName.publishListScreen);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.transparent,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            elevation: 0,
                          ),
                          icon: Icon(
                            Icons.add,
                            size: 16.sp,
                            color: AppColors.black,
                          ),
                          label: Text(
                            AppString.newListing,
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium!.copyWith(fontSize: 14.sp),
                          ),
                        ),

                        SizedBox(height: 16.h),

                        // 🔹 Story Button
                        ElevatedButton.icon(
                          onPressed: () {
                            //<=====================   Story Routing =====================>
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.transparent,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            elevation: 0,
                          ),
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            size: 16.sp,
                            color: AppColors.black,
                          ),
                          label: Text(
                            AppString.story,
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium!.copyWith(fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ).whenComplete(() {
            navController.setBottomSheetState(false); // mark closed
          });
        },
      ),
    );
  }
}
