import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlashCard extends StatelessWidget {
  final int index;
  const FlashCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(30).r,
        ),
        child: Center(
          child: Text(''),
        ),
      );
  }
}
