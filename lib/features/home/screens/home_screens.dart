import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/features/calendar/screens/calendar_screens.dart';
import 'package:template/features/chat/screens/chat_list_screens.dart';
import 'package:template/features/home/bindings/home_content_binding.dart';
import 'package:template/features/home/controllers/navigation_controller.dart';
import 'package:template/features/home/screens/your_listing_screen.dart';
import 'package:template/features/home/widgets/bottom_navbar.dart';
import 'package:template/features/profile/screens/profile_screens.dart';

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
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
