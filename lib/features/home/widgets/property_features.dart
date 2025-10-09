import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/core/constants/app_image_const.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/home/models/property_model.dart';
import 'package:template/features/home/widgets/custome_devider_horiz.dart';

class PropertyFeatures extends StatelessWidget {
  final PropertyModel property;

  const PropertyFeatures({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        _buildFeature(context, property.title, null),
        CustomeDeviderVerti(
          horizontalPadding: 8,
          thickness: 1,
          color: Colors.grey.shade400,
        ),
        _buildFeature(
          context,
          '${property.bathrooms}',
          AppImages.stackSimpleIcon,
        ),
        SizedBox(width: 8.w),
        _buildFeature(context, '${property.bedrooms}', AppImages.bedIcon),
        SizedBox(width: 8.w),
        _buildFeature(context, '${property.bathrooms}', AppImages.bathtubIcon),
        CustomeDeviderVerti(
          horizontalPadding: 8,
          thickness: 1,
          color: Colors.grey.shade400,
        ),
        _buildFeature(
          context,
          '${property.area} ${AppString.sqft}',
          AppImages.rulerIcon,
        ),
      ],
    );
  }

  Widget _buildFeature(BuildContext context, String text, String? icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[SvgPicture.asset(icon), SizedBox(width: 4.w)],
        Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontSize: 14.sp),
        ),
      ],
    );
  }
}
