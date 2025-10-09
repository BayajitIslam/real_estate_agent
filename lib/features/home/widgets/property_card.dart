import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/features/home/models/property_model.dart';
import 'package:template/features/home/widgets/property_image.dart';
import 'package:template/features/home/widgets/property_info.dart';

class PropertyCard extends StatelessWidget {
  final PropertyModel property;

  const PropertyCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to property details
        Get.toNamed('/property-details', arguments: property);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //<================================== Feautre Image & Add To Fav ==========================>
            PropertyImage(property: property),

            //<================================== Property Information ==========================>
            PropertyInfo(property: property),
          ],
        ),
      ),
    );
  }
}
