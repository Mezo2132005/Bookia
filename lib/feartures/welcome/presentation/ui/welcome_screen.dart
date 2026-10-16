import 'package:bookia_application/core/routes/app_routes.dart';
import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:bookia_application/core/theme/app_text_styles.dart';
import 'package:bookia_application/core/widgets/custom_button.dart';
import 'package:bookia_application/core/widgets/translate_button.dart';
import 'package:bookia_application/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/BG.png"),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 15.w,
              top: 25.h,
              child: TranslateButton(contxt: context),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  120.verticalSpace,
                  Image.asset(
                    "assets/images/logo12.png",
                    width: 220.w,
                    height: 75.h,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    LocaleKeys.welcomeText.tr(),
                    style: AppTextStyles.regularFont,
                  ),
                  280.verticalSpace,
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, AppRoutes.login),
                    child: CustomButton(text: LocaleKeys.login.tr(), color: AppColors.basicColor, textstyle: AppTextStyles.buttonFontWhite)),
                  10.verticalSpace,
                  CustomButton(text: LocaleKeys.signin.tr(), color: AppColors.white, textstyle: AppTextStyles.buttonFontblack, borderColor: AppColors.blackBasic,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
