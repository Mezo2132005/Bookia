import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:bookia_application/core/theme/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle regularFont = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight(400),
    color: AppColors.blackBasic,
    fontFamily: AppConstants.fontFamily,
  );
  static TextStyle goldenFont18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight(400),
    color: AppColors.basicColor,
    fontFamily: AppConstants.fontFamily,
  );
  static TextStyle detailsFont12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight(400),
    color: AppColors.blackBasic,
    fontFamily: AppConstants.fontFamily,
  );
  static TextStyle font30 = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight(400),
    color: AppColors.blackBasic,
    fontFamily: AppConstants.fontFamily,
  );
  static TextStyle subTitleFont = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight(400),
    color: AppColors.blackBasic,
    fontFamily: AppConstants.fontFamily,
  );
  static TextStyle buttonFontWhite = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight(400),
    color: AppColors.white,
    fontFamily: AppConstants.fontFamily,
  );
  static TextStyle buttonFontblack = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight(400),
    color: AppColors.blackBasic,
    fontFamily: AppConstants.fontFamily,
  );
}