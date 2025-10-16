import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/home/models/property_model.dart';
import 'package:template/features/home/widgets/additonal_information_view_section.dart';
import 'package:template/features/home/widgets/contact_information_card.dart';
import 'package:template/features/home/widgets/document_section_card.dart';
import 'package:template/features/home/widgets/key_information.dart';
import 'package:template/features/home/widgets/media_section.dart';
import 'package:template/features/home/widgets/property_insight_card.dart';
import 'package:template/features/home/widgets/recent_activity_card.dart';
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

                  // Activity
                  SizedBox(height: 16.h),
                  RecentActivityCard(),
                  // property insight
                  SizedBox(height: 16.h),
                  PropertyInsightCard(),
                  // Document Card
                  SizedBox(height: 16.h),
                  DocumentSectionCard(),

                  //contact
                  SizedBox(height: 16.h),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    padding: EdgeInsets.all(16.w),
                    margin: EdgeInsets.only(top: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.contactInformation,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.sp,
                                color: AppColors.black,
                              ),
                        ),
                        SizedBox(height: 12.h),
                        ContactInformationCard(
                          avatar:
                              "https://i.pinimg.com/1200x/93/ae/42/93ae422ef2fe130437ad6eec339595d8.jpg",
                          username: "Guy Hawking",
                          phoneNumbe: "+1 234 567 788",
                          email: "user@gmail.com",
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
