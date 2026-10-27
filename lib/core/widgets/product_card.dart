
import 'package:bookia_application/core/routes/app_routes.dart';
import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:bookia_application/core/theme/app_text_styles.dart';
import 'package:bookia_application/core/widgets/custom_button.dart';
import 'package:bookia_application/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String name;
  final double price;
  final String image;

  const ProductCard({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163.w,
      height: 281.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: BoxBorder.all(color: AppColors.greyBorder),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 141.w,
            height: 175.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image);
                },
              ),
            ),
          ),

          SizedBox(height: 8.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.subTitleFont,
            ),
          ),

          SizedBox(height: 8.h),

          SizedBox(
            width: 141.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: AppTextStyles.subTitleFont,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                SizedBox(width: 10.w),

                SizedBox(
                  height: 35.h,
                  width: 75.w,
                  child: CustomButton(
                    text: LocaleKeys.Buy.tr(),
                    color: AppColors.blackBasic,
                    textstyle: AppTextStyles.buttonFontWhite,
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.details,arguments: id);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
