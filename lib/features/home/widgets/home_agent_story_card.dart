import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';

class HomeAgentStoryCard extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback onPress;
  final Color borderColor;

  const HomeAgentStoryCard({
    super.key,
    required this.image,
    required this.name,
    required this.onPress,
    this.borderColor = AppColors.yellow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        spacing: 5.h,
        children: [
          Container(
            padding: EdgeInsets.all(2.dm),
            margin: EdgeInsets.symmetric(horizontal: 6.dg),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: borderColor, width: 2),
            ),
            child: Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(image)),
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
