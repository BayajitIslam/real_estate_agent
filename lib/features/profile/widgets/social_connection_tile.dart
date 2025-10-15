import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/profile/widgets/connection_status_button.dart';
import 'package:template/features/profile/widgets/switch_button.dart';

// ignore: must_be_immutable
class SocialConnectionTile extends StatefulWidget {
  SocialConnectionTile({
    super.key,
    required this.icon,
    required this.isConnected,
    required this.socialName,
  });
  bool isConnected = false;
  final String socialName;
  final String icon;

  @override
  State<SocialConnectionTile> createState() => _SocialConnectionTileState();
}

class _SocialConnectionTileState extends State<SocialConnectionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //icon and connected & disconcceted
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //social icon
              Container(
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(12),
                child: SvgPicture.asset(widget.icon, fit: BoxFit.cover),
              ),
              //connected & disconcceted
              ConnectionStatusButton(isConnected: widget.isConnected),
            ],
          ),

          //platform name
          SizedBox(height: 16.h),
          Text(
            widget.socialName,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 20.sp,
              height: 1,
              letterSpacing: 0,
            ),
          ),

          //desctiption
          SizedBox(height: 12.h),
          Text(
            AppString.accesAnsShare,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.bodyTextv2,
              fontSize: 12.sp,
              height: 1,
              letterSpacing: 0,
            ),
          ),

          //connected & disconcceted toggle
          SizedBox(height: 16.h),
          CustomYellowSwitch(
            value: widget.isConnected,
            onChanged: (value) {
              //social connection functyion here
              setState(() => widget.isConnected = !widget.isConnected);
            },
          ),
        ],
      ),
    );
  }
}
