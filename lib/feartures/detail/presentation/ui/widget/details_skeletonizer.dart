import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:bookia_application/core/theme/app_text_styles.dart';
import 'package:bookia_application/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DetailsSkeletonizer extends StatelessWidget {
  const DetailsSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 60.w,
                          child: CustomButton(
                            text: 'text',
                            color: AppColors.white,
                            textstyle: AppTextStyles.buttonFontblack,
                            icon: Icons.arrow_back_ios,
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        SizedBox(
                          width: 60.w,
                          child: CustomButton(
                            text: 'text',
                            color: AppColors.white,
                            textstyle: AppTextStyles.buttonFontblack,
                            icon: Icons.bookmark_outline,
                          ),
                        ),
                      ],
                    ),

                    20.verticalSpace,

                    Container(
                      height: 270.h,
                      width: 180.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),

                    8.verticalSpace,

                    Padding(
                      padding: EdgeInsets.all(30.r),
                      child: Text(
                        'Book name placeholder',
                        style: AppTextStyles.font30,
                      ),
                    ),

                    8.verticalSpace,

                    Padding(
                      padding: EdgeInsets.all(30.r),
                      child: Text(
                        'Price placeholder',
                        style: AppTextStyles.goldenFont18,
                      ),
                    ),

                    8.verticalSpace,

                    Text(
                      'Book description placeholder',
                      style: AppTextStyles.detailsFont12,
                    ),
                  ],
                ),
              ],
            ),
          ),

          SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Price',
                    style: AppTextStyles.font30,
                  ),
                  SizedBox(
                    width: 220.w,
                    child: CustomButton(
                      text: 'Add To Cart',
                      color: AppColors.white,
                      textstyle: AppTextStyles.buttonFontWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
