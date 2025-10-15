import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/calendar/controllers/calendar_controller.dart';
import 'package:template/features/calendar/widgets/appointment_card_widget.dart';
import 'package:template/features/home/widgets/status_chip.dart';
import 'package:template/features/widgets/circle_button_with_border.dart';

class CalendarScreens extends GetView<CalendarController> {
  const CalendarScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Clean App Bar with 2 Buttons
            _buildCleanAppBar(context),

            // Content Area (Changes based on selected button)
            Expanded(
              child: Obx(() {
                if (controller.selectedButton.value == 0) {
                  return _buildCalendarPage();
                } else {
                  return _buildGridPage();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  // Clean App Bar Design
  Widget _buildCleanAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppString.calender,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Obx(
                  () => Text(
                    '${controller.totalAppointments.value} ${AppString.totalAppointment}',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          // 2 Toggle Buttons
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: Row(
              children: [
                // Button 1: Calendar Icon
                Obx(
                  () => _buildToggleButton(
                    iconBlack: AppImages.cardThreeBlackIcon,
                    iconGrey: AppImages.cardThreeGreyIcon,
                    isSelected: controller.selectedButton.value == 0,
                    onTap: () => controller.switchPage(0),
                  ),
                ),

                // Button 2: Grid Icon
                Obx(
                  () => _buildToggleButton(
                    iconBlack: AppImages.kanbanBlackIcon,
                    iconGrey: AppImages.kanbanGreyIcon,
                    isSelected: controller.selectedButton.value == 1,
                    onTap: () => controller.switchPage(1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Toggle Button Widget
  Widget _buildToggleButton({
    required String iconBlack,
    required String iconGrey,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.buttonBackground
              : AppColors.cardBackground,
          borderRadius: BorderRadius.circular(111.r),
        ),
        child: Center(
          child: isSelected
              ? SvgPicture.asset(iconBlack, fit: BoxFit.cover)
              : SvgPicture.asset(iconGrey, fit: BoxFit.cover),
        ),
      ),
    );
  }

  // PAGE 1: Calendar View
  Widget _buildCalendarPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calendar_month, size: 80, color: const Color(0xFF8DD3BB)),
          SizedBox(height: 16.h),
          Text(
            'Calendar Page',
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8.h),
          Text(
            'Calendar view content here',
            style: TextStyle(fontSize: 14.sp, color: const Color(0xFF838C94)),
          ),
        ],
      ),
    );
  }

  // PAGE 2: Grid View
  Widget _buildGridPage() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        border: Border(
          top: BorderSide(color: AppColors.black10, width: 1.0),
          left: BorderSide(color: AppColors.black10, width: 1.0),
          right: BorderSide(color: AppColors.black10, width: 1.0),
        ),
      ),
      child: Column(
        children: [
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatusChip(status: "Waiting"),
              CircleButtonWithBorder(
                onTap: () {},
                icon: Icons.more_horiz,
                isIcon: true,
                radius: 14.r,
              ),
            ],
          ),
          //
          SizedBox(height: 8.h),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return AppointmentCardWidget(
                  id: '2',
                  status: 'Waiting',
                  propertyImage:
                      'https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=800',
                  price: '€692,000',
                  address: '3284 Skyview Lane, WA 98001',
                  propertyType: 'Apartment',
                  date: 'Wednesday, July 31',
                  time: '11:00 AM - 12:00 PM',
                  buyerName: 'John Walker',
                  buyerEmail: 'john@example.com',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
