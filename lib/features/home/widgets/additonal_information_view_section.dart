import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/home/models/property_model.dart';
import 'package:template/features/home/widgets/listing_description_widget.dart';

class AdditonalInformation extends StatelessWidget {
  AdditonalInformation({super.key});

  final PropertyModel argument = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24.r),
      ),
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(top: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.additonalInfo,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          Text(
            AppString.infoNecessaryTocreate,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 14.sp,
              color: AppColors.bodyTextv2,
            ),
          ),

          //================================info card=============================
          SizedBox(height: 16.h),
          Column(
            children: [
              Row(
                children: [
                  _buildInfoCard(
                    context,
                    AppImages.rulerIcon,
                    AppString.areaSize,
                    argument.area.toString(),
                  ),
                  SizedBox(width: 12.w),
                  _buildInfoCard(
                    context,
                    AppImages.stackSimpleIcon,
                    AppString.livingSpace,
                    argument.livingSpace.toString(),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  _buildInfoCard(
                    context,
                    AppImages.bedIcon,
                    AppString.bedroom,
                    argument.bedrooms.toString(),
                  ),
                  SizedBox(width: 12.w),
                  _buildInfoCard(
                    context,
                    AppImages.bathtubIcon,
                    AppString.bathroom,
                    argument.bathrooms.toString(),
                  ),
                ],
              ),
            ],
          ),

          //================================Facilities section=============================
          SizedBox(height: 16.h),
          Text(
            AppString.facilities,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 44.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: argument.facilities.length,
              itemBuilder: (context, index) {
                //individula facilities
                final facilities = argument.facilities[index];
                return _buildFacilityChip(facilities);
              },
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            AppString.energyCertificate,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 12.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              _buildFacilityChip('Garage'),
              _buildFacilityChip('Garage'),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: _buildEnergyInfoCard(
                  AppString.energyRating,
                  '4.1',
                  AppImages.energyRatingIcon,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: _buildEnergyInfoCard(
                  AppString.consumtion,
                  '4.1',
                  AppImages.consumptionIcon,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: _buildEnergyInfoCard(
                  AppString.emission,
                  '4.1',
                  AppImages.emisonIcon,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            AppString.energyCertificate,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 12.h),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColors.black10, width: 1),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              minimumSize: Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {
              // certificate download function here
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppImages.pdfIcon),
                SizedBox(width: 4.5.w),
                Text(
                  "Certification.pdf",
                  style: TextStyle(fontSize: 14.sp, color: AppColors.black),
                ),
              ],
            ),
          ),

          //================================Listing Descriptiopn section=============================
          SizedBox(height: 16.h),
          ListingDescriptionWidget(
            descriptions: {
              'English':
                  'The architectural firm has done an exceptional job, preserving the building\'s historical essence, its traditional Cádiz façade and patio, enhanced by a classic design that combines with the vanguard of contemporary architecture.',
              'France':
                  'Le cabinet d\'architecture a fait un travail exceptionnel en préservant l\'essence historique du bâtiment, sa façade traditionnelle de Cadix et son patio, rehaussés par un design classique qui se marie avec l\'avant-garde.',
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildInfoCard(
  BuildContext context,
  String icon,
  String label,
  String value,
) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.black,
                  ),
                ),
                Row(
                  children: [
                    //icon
                    SvgPicture.asset(icon),
                    //value
                    SizedBox(width: 4.5.w),
                    Text(
                      value,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

//======================================= Facility Card =================================
Widget _buildFacilityChip(String label) {
  return Container(
    height: 44.h,
    margin: EdgeInsets.only(right: 16.w),
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    decoration: BoxDecoration(
      color: AppColors.cardBackground,
      borderRadius: BorderRadius.circular(32.r),
      border: Border.all(width: 1, color: AppColors.black10),
    ),
    child: Text(
      label,
      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
    ),
  );
}

//================================================= Energy Certificate Card ===================================
Widget _buildEnergyInfoCard(String label, String value, String icon) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.cardBackground,
      borderRadius: BorderRadius.circular(8.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            SvgPicture.asset(icon),

            SizedBox(width: 4.5.w),
            Text(
              value,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    ),
  );
}
