import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';

class DocumentSectionCard extends StatelessWidget {
  const DocumentSectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(top: 8.h),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.documents,
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
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 16, color: AppColors.black),
              label: Text(
                AppString.uploadMore,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                side: BorderSide(color: AppColors.black10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildDocumentItem(BuildContext context, String fileName) {
  return InkWell(
    onTap: () {
      //
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.buttonBorderBlack),
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Row(
        children: [
          const Icon(Icons.insert_drive_file_outlined, size: 20),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              fileName,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 14,
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Icon(Icons.close, size: 12),
        ],
      ),
    ),
  );
}
