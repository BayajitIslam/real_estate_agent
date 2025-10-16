import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Obx(
                  () => TableCalendar(
                    locale: "en_US",

                    headerStyle: HeaderStyle(
                      titleTextStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      titleTextFormatter: (date, locale) {
                        // Only show month name
                        return _monthName(date.month);
                      },
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        color: AppColors.black,
                        fontSize: 16.sp, // Change weekday font size
                        fontWeight: FontWeight.bold,
                      ),
                      weekendStyle: TextStyle(
                        color: AppColors.black, // Change weekend color
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    daysOfWeekHeight: 18.sp,

                    calendarStyle: CalendarStyle(
                      selectedTextStyle: TextStyle(
                        color: AppColors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      todayTextStyle: TextStyle(
                        color: AppColors.black,

                        fontWeight: FontWeight.w600,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colors.transparent,

                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: AppColors.grey,
                        shape: BoxShape.circle,
                      ),
                      defaultTextStyle: TextStyle(fontWeight: FontWeight.w600),
                      weekendTextStyle: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    availableGestures: AvailableGestures.all,
                    selectedDayPredicate: (day) =>
                        isSameDay(day, controller.today.value),
                    focusedDay: controller.today.value,
                    firstDay: DateTime.utc(2020, 10, 10),
                    lastDay: DateTime.utc(2099, 10, 10),
                    onDaySelected: controller.onDaySelect,
                  ),
                ),
              ),
            ),

            //silver list
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.w),
                  child: AppointmentCardWidget(
                    id: '2',
                    status: 'Accepted',
                    propertyImage:
                        'https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=800',
                    price: '€692,000',
                    address: '3284 Skyview Lane, WA 98001',
                    propertyType: 'Apartment',
                    date: 'Wednesday, July 31',
                    time: '11:00 AM - 12:00 PM',
                    buyerName: 'John Walker',
                    buyerEmail: 'john@example.com',
                  ),
                ),

                childCount: 5,
              ),
            ),
          ],
        ),
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

// Helper function to get month name
String _monthName(int month) {
  const months = [
    '', // index 0 unused
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December',
  ];
  return months[month];
}
