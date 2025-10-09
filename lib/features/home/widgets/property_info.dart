import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/home/models/property_model.dart';
import 'package:template/features/home/widgets/boost_button.dart';
import 'package:template/features/home/widgets/custome_devider_horiz.dart';
import 'package:template/features/home/widgets/property_features.dart';
import 'package:template/features/home/widgets/status_chip.dart';

class PropertyInfo extends StatelessWidget {
  final PropertyModel property;

  const PropertyInfo({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //<================================== Status &  listing Date ==========================>
          Row(
            children: [
              StatusChip(status: property.status),
              const Spacer(),
              Text(
                '${AppString.listingDate} ${property.listingDate}',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: AppColors.bodyTextv2),
              ),
            ],
          ),

          //<================================== Property Price  ==========================>
          SizedBox(height: 12.h),

          Text(
            property.formattedPrice,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),

          //<================================== Property Features  ==========================>
          SizedBox(height: 8.h),
          PropertyFeatures(property: property),

          //<================================== Title badges  ==========================>
          SizedBox(height: 8.h),
          Row(
            children: [
              _buildBadge('Lowest price'),
              CustomeDeviderVerti(),
              _buildBadge('Exclusive'),
              CustomeDeviderVerti(),
              _buildBadge('Brand new'),
            ],
          ),

          //<==================================  Property Location  ==========================>
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 16.sp,
                color: AppColors.bodyTextv1,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  property.address,
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium!.copyWith(color: AppColors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          //<================================== Description text  ==========================>
          SizedBox(height: 8.w),
          Text(
            property.description,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          //<================================== Bosost Button & More Info Button  ==========================>
          SizedBox(height: 12.h),
          if (property.isBoosted) const BoostButton(),
        ],
      ),
    );
  }
}

//<================================== Build badges ==========================>
Widget _buildBadge(String text) {
  return Container(
    decoration: BoxDecoration(),
    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    child: Text(
      text,
      style: TextStyle(
        color: AppColors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
