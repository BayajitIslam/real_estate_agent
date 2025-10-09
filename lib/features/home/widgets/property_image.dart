import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/features/home/models/property_model.dart';

class PropertyImage extends StatelessWidget {
  final PropertyModel property;

  const PropertyImage({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //<================================== Image ==========================>
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.network(
            property.imageUrl,
            height: 193.h,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 193.h,
                color: AppColors.grey,
                child: Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: 48.sp,
                    color: AppColors.bodyTextv1,
                  ),
                ),
              );
            },
          ),
        ),

        //<================================== Add To Fav ==========================>
        Positioned(
          top: 12.h,
          right: 12.w,
          child: CircleAvatar(
            radius: 18.r,
            backgroundColor: AppColors.black,
            child: Icon(
              Icons.favorite_border,
              color: AppColors.whiteText,
              size: 18.sp,
            ),
          ),
        ),
      ],
    );
  }
}
