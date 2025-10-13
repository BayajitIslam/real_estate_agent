import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/profile/models/integration_model.dart';
import 'package:template/features/profile/widgets/social_connection_tile.dart';
import 'package:template/features/widgets/circle_button_with_border.dart';
import 'package:template/features/widgets/custom_search_bar.dart';

class IntegrationScreen extends StatelessWidget {
  const IntegrationScreen({super.key});

  // integration connected or not
  final bool isConnected = false;

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
          AppString.integration,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 16.sp,
            height: 1.2,
            letterSpacing: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 16),

            //Custome Search
            CustomSearchBar(
              hintText: AppString.searchPlatform,
              onChanged: (_) {},
            ),

            //all social tile here
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _simpleIntegrations.length,
                itemBuilder: (context, index) {
                  //individual social inforamtion
                  final socialInfo = _simpleIntegrations[index];
                  return SocialConnectionTile(
                    icon: socialInfo.icon,
                    socialName: socialInfo.name,
                    isConnected: socialInfo.isConnected,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//sample data
final List<IntegrationModel> _simpleIntegrations = [
  IntegrationModel(name: AppString.facebook, icon: AppImages.facebookSvgIcon),
  IntegrationModel(name: AppString.google, icon: AppImages.googleSvgIcon),
  IntegrationModel(name: AppString.x, icon: AppImages.twiterXIcon),
  IntegrationModel(name: AppString.instagram, icon: AppImages.instramIcon),
];
