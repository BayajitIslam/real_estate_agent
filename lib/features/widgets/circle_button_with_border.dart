import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_image_const.dart';

class CircleButtonWithBorder extends StatelessWidget {
  const CircleButtonWithBorder({
    super.key,
    this.icon = Icons.abc_outlined,
    this.svgimageIcon = AppImages.filterIcon,
    this.isIcon = false,
    this.radius = 24,
    required this.onTap
  });

  final bool isIcon;
  final IconData icon;
  final String svgimageIcon;
  final double radius;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(2), // border thickness
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.textFieldBorder, // your border color
            width: 1, // border width
          ),
        ),
        child: CircleAvatar(
          radius: radius.r,
          backgroundColor: Colors.transparent,
          child: isIcon ? Icon(icon, size: 20,color: AppColors.black,) : SvgPicture.asset(svgimageIcon),
        ),
      ),
    );
  }
}
