import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final double? borderRadius;

  const DefaultIconButton({
    super.key,
    required this.iconData,
    this.borderRadius,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(10).w,
        padding: const EdgeInsets.all(10).w,
        decoration: BoxDecoration(
          color: AppColors.mainColor.withOpacity(.3),
          borderRadius: BorderRadius.circular(borderRadius?.r??15.r)
        ),
        child: Icon(
          iconData,color:AppColors.secondary,size: 20.sp,
        ),
      ),
    );
  }
}
