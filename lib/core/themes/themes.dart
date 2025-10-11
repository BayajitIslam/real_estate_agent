import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppThemes {
  static ThemeData get lightThemes => ThemeData(
    brightness: Brightness.light,

    //<===================== Font Family =====================>
    fontFamily: GoogleFonts.openSans().fontFamily,

    //<===================== Elevated Button =====================>
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonBackground,
        foregroundColor: AppColors.black,
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 16.w),
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.background),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),

    //<===================== Text Theme =====================>
    textTheme: TextTheme(
      titleSmall: TextStyle(
        color: AppColors.black,
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        height: 1.0,
        letterSpacing: 0.068,
      ),
      titleMedium: TextStyle(
        color: AppColors.black,
        fontSize: 32.sp,
        fontWeight: FontWeight.w500,
        height: 1.0,
        letterSpacing: 0.068,
      ),
      bodySmall: TextStyle(
        color: AppColors.bodyTextv2,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0.4,
      ),
      labelMedium: TextStyle(
        color: AppColors.whiteText,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        height: 1,
        letterSpacing: 0.648,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(),
    useMaterial3: true,
    useSystemColors: true,
    buttonTheme: ButtonThemeData(),
    cardTheme: CardThemeData(),
    checkboxTheme: CheckboxThemeData(),
    progressIndicatorTheme: ProgressIndicatorThemeData(),
    cardColor: AppColors.cardBackground,
    scaffoldBackgroundColor: AppColors.background,
  );
}
