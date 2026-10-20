
import 'package:bookia_application/core/routes/app_routes.dart';
import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:bookia_application/core/theme/app_text_styles.dart';
import 'package:bookia_application/core/widgets/custom_button.dart';
import 'package:bookia_application/feartures/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:bookia_application/feartures/auth/presentation/ui/widgets/auth_text_field.dart';
import 'package:bookia_application/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new),
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: Text(
                      LocaleKeys.loginWellcome.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AuthTextField(
                          controller: emailController,
                          isPassword: false,
                          hintText: LocaleKeys.enterYourEmail.tr(),
                        ),

                        10.verticalSpace,

                        AuthTextField(
                          controller: passwordController,
                          isPassword: true,
                          hintText: LocaleKeys.enterYourPassword.tr(),
                        ),

                        10.verticalSpace,

                        BlocConsumer<AuthCubit, AuthState>(
                          listener: (context, state) {
                            if (state is LoginSuccess) {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.home,
                              );
                            }

                            if (state is LoginError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Login failed'),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is LoginLoading) {
                              return const CircularProgressIndicator();
                            }

                            return CustomButton(
                              text: LocaleKeys.login.tr(),
                              color: AppColors.basicColor,
                              textstyle: AppTextStyles.buttonFontWhite,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().login(
                                    emailController.text.trim(),
                                    passwordController.text,
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
