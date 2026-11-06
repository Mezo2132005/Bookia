import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  final VoidCallback? onLogout;

  const ProfileHeader({super.key, this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              'Profile',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.blackBasic,
              ),
            ),
          ),
          IconButton(
            onPressed: onLogout,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: Icon(
              Icons.logout_outlined,
              size: 21.sp,
              color: AppColors.blackBasic,
            ),
          ),
        ],
      ),
    );
  }
}
