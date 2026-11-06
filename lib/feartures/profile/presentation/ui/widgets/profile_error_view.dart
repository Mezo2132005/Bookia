
import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileErrorView extends StatelessWidget {
  final VoidCallback onRetry;

  const ProfileErrorView({
    super.key,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error_outline,
            size: 45,
            color: Colors.grey,
          ),

          12.verticalSpace,

          const Text(
            'Failed to load profile',
            style: TextStyle(fontSize: 16),
          ),

          12.verticalSpace,

          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.basicColor,
              foregroundColor: Colors.white,
            ),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
