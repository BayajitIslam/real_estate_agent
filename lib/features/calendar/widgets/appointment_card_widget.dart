import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';

class AppointmentCardWidget extends StatelessWidget {
  final String status; // 'Accepted', 'Waiting', 'Declined'
  final String propertyImage;
  final String price;
  final String address;
  final String propertyType;
  final String date;
  final String time;
  final String buyerName;
  final String buyerEmail;
  final String buyerAvatar;
  final VoidCallback? onAccept;
  final VoidCallback? onDecline;

  const AppointmentCardWidget({
    super.key,
    required this.status,
    required this.propertyImage,
    required this.price,
    required this.address,
    required this.propertyType,
    required this.date,
    required this.time,
    required this.buyerName,
    required this.buyerEmail,
    this.buyerAvatar = '',
    this.onAccept,
    this.onDecline,
    required String id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.black10, width: 1),
            ),
            child: Column(
              children: [
                // Header - Tour request + Status badge
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 26.h,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Center(
                        child: Text(
                          AppString.tourRequest,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    _buildStatusBadge(),
                  ],
                ),
                SizedBox(height: 12.h),

                // Property Info
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Property Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.network(
                        propertyImage,
                        width: 71.w,
                        height: 71.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 71.w,
                            height: 71.h,
                            color: AppColors.background,
                            child: const Icon(Icons.image, size: 30),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 12.w),

                    // Property Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            price,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 16,
                                color: AppColors.black,
                              ),
                              SizedBox(width: 4.w),
                              Expanded(
                                child: Text(
                                  address,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.black,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            propertyType,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h),

          // Date & Time
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.date,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF838C94),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.time,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.bodyTextv1,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          // Buyer Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.buyer,
                style: TextStyle(fontSize: 14.sp, color: AppColors.bodyTextv1),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundColor: const Color(0xFFF5F5F5),
                    backgroundImage: buyerAvatar.isNotEmpty
                        ? NetworkImage(buyerAvatar)
                        : null,
                    child: buyerAvatar.isEmpty
                        ? Text(
                            buyerName[0].toUpperCase(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : null,
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        buyerName,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        buyerEmail,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.bodyTextv1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          // Action Buttons (only for Waiting status)
          if (status == 'Waiting') ...[
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onAccept,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.whiteText,
                      backgroundColor: Color(0xFF272F33),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      side: const BorderSide(color: Colors.transparent),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                    ),
                    child: Text(
                      AppString.accept,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteText,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: OutlinedButton(
                    onPressed: onDecline,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.red,
                      backgroundColor: AppColors.red10,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      side: const BorderSide(color: Colors.transparent),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                    ),
                    child: Text(
                      AppString.decline,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    Color bgColor;
    Color textColor;

    switch (status) {
      case 'Accepted':
        bgColor = AppColors.green;
        textColor = AppColors.whiteText;
        break;
      case 'Waiting':
        bgColor = AppColors.yellow;
        textColor = AppColors.black;
        break;
      case 'Declined':
        bgColor = AppColors.red;
        textColor = AppColors.whiteText;
        break;
      default:
        bgColor = const Color(0xFFF5F5F5);
        textColor = AppColors.whiteText;
    }

    return Container(
      height: 26.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Center(
        child: Text(
          status,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
