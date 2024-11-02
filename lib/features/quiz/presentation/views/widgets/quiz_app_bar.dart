import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizAppBar extends StatelessWidget {
  final String title;
  const QuizAppBar({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.secondary,
            size: 16.sp,
          ),
        ),
        Text(title)
      ],
    );
  }
}
