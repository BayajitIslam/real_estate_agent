import 'package:flutter/material.dart';
import 'package:template/core/constants/app_colors.dart';

class CustomeDeviderVerti extends StatelessWidget {
  final double height;
  final double thickness;
  final Color color;
  final double horizontalPadding;

  const CustomeDeviderVerti({
    super.key,
    this.height = 14,
    this.thickness = 2,
    this.color = AppColors.black,
    this.horizontalPadding = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Container(width: thickness, height: height, color: color),
    );
  }
}
