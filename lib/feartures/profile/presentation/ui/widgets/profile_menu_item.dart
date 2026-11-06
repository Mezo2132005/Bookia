
import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Material(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6.r),
          child: Container(
            constraints: BoxConstraints(
              minHeight: 41.h,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 8.h,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greyBorder,
              ),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                  size: 23.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
