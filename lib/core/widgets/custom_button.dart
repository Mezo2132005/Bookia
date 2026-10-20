
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    this.borderColor,
    required this.textstyle,
    this.onPressed,
  });

  final String text;
  final Color color;
  final Color? borderColor;
  final TextStyle textstyle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          height: 60.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.r),
            border: borderColor != null
                ? Border.all(color: borderColor!)
                : null,
          ),
          child: Center(
            child: Text(
              text,
              style: textstyle,
            ),
          ),
        ),
      ),
    );
  }
}
