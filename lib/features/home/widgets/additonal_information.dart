import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/home/models/property_model.dart';

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

          SizedBox(height: 16.h),
          Text(
            'Facilities',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
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
              _buildFacilityChip('Garage'),
              _buildFacilityChip('Garden'),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'Energy certificate',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
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
              Expanded(child: _buildEnergyInfoCard('Energy Rating', '4.1')),
              SizedBox(width: 8.w),
              Expanded(child: _buildEnergyInfoCard('Consumption', '>')),
              SizedBox(width: 8.w),
              Expanded(child: _buildEnergyInfoCard('Emission', '4.1')),
            ],
          ),
          SizedBox(height: 12.h),
          OutlinedButton.icon(
            onPressed: () {
              //Document Download Function
            },
            icon: const Icon(Icons.file_download_outlined, size: 16),
            label: Text(
              'Energy certificate',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontSize: 12.sp),
            ),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              side: BorderSide(color: Colors.grey.shade300),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          TextButton.icon(
            onPressed: () {
              //Document Download Function
            },
            icon: const Icon(Icons.insert_drive_file_outlined, size: 16),
            label: Text(
              'Certification.pdf',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontSize: 12.sp),
            ),
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
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

Widget _buildFacilityChip(String label) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
    decoration: BoxDecoration(
      color: AppColors.cardBackground,
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: Text(
      label,
      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
    ),
  );
}

Widget _buildEnergyInfoCard(String label, String value) {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      color: AppColors.cardBackground,
      borderRadius: BorderRadius.circular(8.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 10.sp, color: AppColors.bodyTextv2),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
