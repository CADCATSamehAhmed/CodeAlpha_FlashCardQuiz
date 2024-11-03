import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrime;
  final Color? shadowColor;
  final double? height;
  final double? width;

  const CustomButton({
    super.key,
    required this.text,
    required this.isPrime,
    this.shadowColor,
    required this.onPressed,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: isPrime?AppColors.mainColor:Colors.white,
          padding: const EdgeInsets.all(10).w,
          shadowColor: shadowColor,
          shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(15.r))),
      child: SizedBox(
        height: height??100.h,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color:isPrime?Colors.white:AppColors.secondary,
              fontSize:16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
