
import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:bookia_application/feartures/profile/data/models/profile_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileUserInfo extends StatelessWidget {
  final ProfileDataModel? data;
  final bool isLoading;

  const ProfileUserInfo({
    super.key,
    required this.data,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final String name = isLoading
        ? 'Loading User Name'
        : (data?.name?.isNotEmpty == true
            ? data!.name!
            : 'No Name');

    final String email = isLoading
        ? 'user@email.com'
        : (data?.email?.isNotEmpty == true
            ? data!.email!
            : 'No Email');

    return Row(
      children: [
        _buildProfileImage(),

        10.horizontalSpace,

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackBasic,
                ),
              ),

              3.verticalSpace,

              Text(
                email,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    if (isLoading) {
      return Bone.circle(size: 60.r);
    }

    if (data?.image == null || data!.image!.isEmpty) {
      return _defaultProfileImage();
    }

    return ClipOval(
      child: Image.network(
        data!.image!,
        width: 60.r,
        height: 60.r,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _defaultProfileImage();
        },
      ),
    );
  }

  Widget _defaultProfileImage() {
    return Container(
      width: 60.r,
      height: 60.r,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffD9D9D9),
      ),
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: 35.sp,
      ),
    );
  }
}
