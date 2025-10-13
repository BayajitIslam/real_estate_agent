import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/home/models/property_model.dart';
import 'package:template/features/home/widgets/additonal_information.dart';
import 'package:template/features/home/widgets/key_information.dart';
import 'package:template/features/home/widgets/media_section.dart';
import 'package:template/features/widgets/circle_button_with_border.dart';

class PropertyDetailView extends StatelessWidget {
  PropertyDetailView({super.key});

  final PropertyModel argument = Get.arguments as PropertyModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leadingWidth: 70.w,
        leading: CircleButtonWithBorder(
          isIcon: true,
          icon: Icons.arrow_back,
          onTap: Get.back,
        ),
        title: Text(
          AppString.propertyDetails,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 16.sp,
            height: 1.2,
            letterSpacing: 0,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Media Section
                  SizedBox(height: 16.h),
                  MediaSection(),
                  // Key Information
                  SizedBox(height: 16.h),
                  KeyInformation(),
                  // Additional Information
                  SizedBox(height: 16.h),
                  AdditonalInformation(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context,
    IconData icon,
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
            Icon(icon, size: 20, color: AppColors.black),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.bodyTextv2,
                    ),
                  ),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Contact Information
  Widget _buildContactInformation(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(top: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact information',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 12.h),
          Obx(
            () => Row(
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: AppColors.cardBackground,
                  child: const Icon(Icons.person),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Guy Hawking",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "user@gmail.com",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.bodyTextv2,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //expand contact information
                  },
                  icon: const Icon(Icons.arrow_downward),
                  color: AppColors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
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

// Contact Information
Widget _buildContactInformation(BuildContext context) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(16.w),
    margin: EdgeInsets.only(top: 8.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact information',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            CircleAvatar(
              radius: 24.r,
              backgroundColor: AppColors.cardBackground,
              child: const Icon(Icons.person),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Guy Hawking",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "user@gmail.com",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.bodyTextv2,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                //expand contact information
              },
              icon: const Icon(Icons.arrow_downward),
              color: AppColors.black,
            ),
          ],
        ),
      ],
    ),
  );
}

// Listing Description
Widget _buildListingDescription(BuildContext context) {
  final arguments = Get.arguments;
  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(16.w),
    margin: EdgeInsets.only(top: 8.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Listing description',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'English',
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
              SizedBox(width: 8.w),
              Text(
                'France',
                style: TextStyle(color: Colors.grey, fontSize: 12.sp),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'this charming home offers 3 bedrooms and 2 bathrooms with exceptional job, preserving the building\'s historical essence with decorative facade and patio, enhanced by a classic design that combines with a magnificent garden...',
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: arguments.isDescriptionExpanded.value ? null : 3,
                overflow: arguments.isDescriptionExpanded.value
                    ? null
                    : TextOverflow.ellipsis,
              ),
              TextButton(
                onPressed: () => arguments.toggleDescription(),
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Text(
                  arguments.isDescriptionExpanded.value
                      ? 'Show less'
                      : 'Read more',
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// Activity
Widget _buildActivity(BuildContext context) {
  final arguments = Get.arguments;
  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(16.w),
    margin: EdgeInsets.only(top: 8.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Activity',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: 16.h),

        Obx(
          () => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: arguments.activities.length,
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              final activity = arguments.activities[index];
              return Row(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundColor: AppColors.cardBackground,
                    child: Text(
                      activity['name']![0],
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodySmall,
                            children: [
                              TextSpan(
                                text: '${activity['name']} ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(text: activity['action']),
                            ],
                          ),
                        ),
                        Text(
                          activity['time']!,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.bodyTextv2,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 12.h),
        Center(
          child: TextButton(
            onPressed: () => arguments.viewMoreActivities(),
            child: Text(
              'View more',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

// Property Insight
Widget _buildPropertyInsight(BuildContext context) {
  final arguments = Get.arguments;
  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(16.w),
    margin: EdgeInsets.only(top: 8.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Property insight',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: 16.h),
        Obx(
          () => Column(
            children: [
              _buildInsightRow(context, 'Base Price', arguments.basePrice),
              _buildInsightRow(
                context,
                'Negotiation Range',
                arguments.negotiationRange,
              ),
              _buildInsightRow(context, 'Expiry Date', arguments.expiryDate),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildInsightRow(BuildContext context, String label, String value) {
  return Padding(
    padding: EdgeInsets.only(bottom: 12.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppColors.bodyTextv2),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
      ],
    ),
  );
}

// Documents
Widget _buildDocuments(BuildContext context) {
  final arguments = Get.arguments;
  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(16.w),
    margin: EdgeInsets.only(top: 8.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Documents',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: 12.h),
        _buildDocumentItem(context, 'Data report.pdf'),
        SizedBox(height: 8.h),
        _buildDocumentItem(context, 'Financial Report.xls'),
        SizedBox(height: 12.h),
        OutlinedButton.icon(
          onPressed: () => arguments.uploadDocument(),
          icon: const Icon(Icons.add, size: 16, color: Colors.red),
          label: Text(
            'Upload more',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontSize: 14.sp, color: Colors.red),
          ),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            side: BorderSide(color: Colors.grey.shade300),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36.r),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildDocumentItem(BuildContext context, String fileName) {
  final arguments = Get.arguments;
  return InkWell(
    onTap: () {
      //
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(36.r),
      ),
      child: Row(
        children: [
          const Icon(Icons.insert_drive_file_outlined, size: 20),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              fileName,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          const Icon(Icons.chevron_right, size: 20),
        ],
      ),
    ),
  );
}
