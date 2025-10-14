import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';

class ContactInformationCard extends StatelessWidget {
  final String avatar;
  final String username;
  final String phoneNumbe;
  final String email;
  const ContactInformationCard({
    super.key,
    required this.avatar,
    required this.email,
    required this.phoneNumbe,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.black10),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 24.r, backgroundImage: NetworkImage(avatar)),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text(
                        phoneNumbe,
                        overflow: TextOverflow.visible,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                    ),

                    //
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      height: 4.h,
                      width: 4.w,
                      decoration: BoxDecoration(
                        color: AppColors.bodyTextv1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    //
                    Flexible(
                      flex: 1,
                      child: Text(
                        email,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Transform.rotate(
            angle: -90 * 3.1416 / 180,
            child: IconButton(
              onPressed: () {
                //expand contact information
              },
              icon: const Icon(Icons.arrow_back_ios_new, size: 14),
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
