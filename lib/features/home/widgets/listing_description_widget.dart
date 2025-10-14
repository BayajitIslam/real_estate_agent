import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';

class ListingDescriptionWidget extends StatefulWidget {
  final String title;
  final Map<String, String> descriptions;
  final String initialLanguage;
  final int maxLines;

  const ListingDescriptionWidget({
    super.key,
    this.title = 'Listing description',
    required this.descriptions,
    this.initialLanguage = 'English',
    this.maxLines = 5,
  });

  @override
  State<ListingDescriptionWidget> createState() =>
      _ListingDescriptionWidgetState();
}

class _ListingDescriptionWidgetState extends State<ListingDescriptionWidget> {
  late String selectedLanguage;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    selectedLanguage = widget.initialLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 16.h),

          // Language Toggle Buttons
          _buildLanguageToggle(),

          SizedBox(height: 16.h),

          // Description Text
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.descriptions[selectedLanguage] ?? '',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.bodyTextv2,
                    height: 1.6,
                  ),
                  maxLines: isExpanded ? null : widget.maxLines,
                  overflow: isExpanded ? null : TextOverflow.ellipsis,
                ),

                // Read More / Show Less Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Text(
                      isExpanded ? AppString.showLess : AppString.readMore,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageToggle() {
    final languages = widget.descriptions.keys.toList();

    return Row(
      children: List.generate(languages.length, (index) {
        final language = languages[index];
        final isSelected = language == selectedLanguage;
        final isLast = index == languages.length - 1;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: isLast ? 0 : 8.w),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedLanguage = language;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF272F33)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(
                    color: isSelected ? AppColors.black70 : AppColors.black10,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    language,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? AppColors.whiteText : AppColors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
