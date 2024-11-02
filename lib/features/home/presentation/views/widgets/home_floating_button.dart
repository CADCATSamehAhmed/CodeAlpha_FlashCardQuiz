import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFloatingButton extends StatelessWidget {
  final int index;

  const HomeFloatingButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
      return FloatingActionButton(
        heroTag: 'FloatingActionButtonHeroTag',
        tooltip: 'FloatingActionButtonTooltip',
        onPressed: (){},
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        child: Container(
          padding: const EdgeInsets.all(20).w,
          height: 60.w,
          width: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: AppColors.mainColor,
          ),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
        ),
      );
  }
}
