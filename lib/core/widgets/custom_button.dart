import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.color, this.borderColor, required this.textstyle});
  final String text;
  final Color color;
  final Color? borderColor;
  final TextStyle textstyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadiusGeometry.circular(8.r),
          border: borderColor != null? Border.all(color: borderColor!): null
        ),
        child: Center(child: Text(text,style: textstyle,)),
      ),
    );
  }
}