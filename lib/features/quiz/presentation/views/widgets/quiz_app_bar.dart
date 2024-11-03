import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizAppBar extends StatelessWidget {
  final String title;

  const QuizAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15.w, 30.h, 15.w, 15.h),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.secondary,
              size: 20.sp,
            ),
          ),
          Text(
            title,
            style: TextStyle(
                color: AppColors.secondary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
