
import 'package:bookia_application/core/routes/app_routes.dart';
import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:bookia_application/feartures/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia_application/feartures/profile/presentation/ui/widgets/profile_error_view.dart';
import 'package:bookia_application/feartures/profile/presentation/ui/widgets/profile_header.dart';
import 'package:bookia_application/feartures/profile/presentation/ui/widgets/profile_menu_item.dart';
import 'package:bookia_application/feartures/profile/presentation/ui/widgets/profile_user_info.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback? onLogout;
  final ValueChanged<String>? onMenuTap;

  const ProfileScreen({
    super.key,
    this.onLogout,
    this.onMenuTap,
  });

  static const List<String> menuItems = [
    'My Orders',
    'Edit Profile',
    'Reset Password',
    'FAQ',
    'Contact Us',
    'Privacy & Terms',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is LogOutSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.welcome,
            (route) => false,
          );
        }

        if (state is LogOutFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Logout Failed!'),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                buildWhen: (previous, current) =>
                    current is ProfileLoading ||
                    current is ProfileSuccess ||
                    current is ProfileFailed,
                builder: (context, state) {
                  if (state is ProfileLoading ||
                      state is ProfileInitial) {
                    return _buildProfileContent(
                      isLoading: true,
                      onLogout: null,
                    );
                  }

                  if (state is ProfileSuccess) {
                    return _buildProfileContent(
                      data: state.response.data,
                      isLoading: false,
                      onLogout: onLogout ??
                          () => context.read<ProfileCubit>().logOut(),
                    );
                  }

                  if (state is ProfileFailed) {
                    return ProfileErrorView(
                      onRetry: () {
                        context.read<ProfileCubit>().showProfile();
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),

              // Logout Loading
              BlocBuilder<ProfileCubit, ProfileState>(
                buildWhen: (previous, current) =>
                    current is LogOutLoading ||
                    current is LogOutSuccess ||
                    current is LogOutFailed,
                builder: (context, state) {
                  if (state is LogOutLoading) {
                    return Container(
                      //color: Colors.black.withValues(alpha: 0.15),
                      child: Center(
                        child: CircularProgressIndicator(color: AppColors.basicColor,),
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileContent({
    data,
    required bool isLoading,
    required VoidCallback? onLogout,
  }) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Skeletonizer(
        enabled: isLoading,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 8.h,
          ),
          child: Column(
            children: [
              ProfileHeader(
                onLogout: onLogout,
              ),

              12.verticalSpace,

              ProfileUserInfo(
                data: data,
                isLoading: isLoading,
              ),

              25.verticalSpace,

              ...menuItems.map(
                (item) => ProfileMenuItem(
                  title: item,
                  onTap: isLoading || onMenuTap == null
                      ? null
                      : () => onMenuTap!(item),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
