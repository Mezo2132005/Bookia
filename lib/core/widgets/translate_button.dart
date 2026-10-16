import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TranslateButton extends StatelessWidget {
  const TranslateButton({super.key, required this.contxt});
  final BuildContext contxt;
  @override
  Widget build(BuildContext contxt) {
    return IconButton(
      onPressed: () {
        if (contxt.locale.languageCode == "en") {
          contxt.setLocale(Locale("ar"));
        } else {
          contxt.setLocale(Locale("en"));
        }
      },
      icon: Icon(Icons.language, color: AppColors.blackBasic, size: 36.r),
    );
  }
}
