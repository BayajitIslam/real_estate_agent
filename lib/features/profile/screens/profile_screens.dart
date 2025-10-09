import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/features/home/controllers/your_listing_controller.dart';

class ProfileScreens extends GetView<YourListingController> {
  const ProfileScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Profile")));
  }
}
