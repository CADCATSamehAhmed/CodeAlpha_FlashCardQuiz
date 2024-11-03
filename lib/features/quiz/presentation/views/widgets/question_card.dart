import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final VoidCallback onPressed;
  const QuestionCard({super.key, required this.question, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          height: 250.h,
          width: 300.w,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 30).h,
          padding: const EdgeInsets.all(20).w,
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(30).r,
          ),
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.sp,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10).w,
          child: IconButton(
            padding: const EdgeInsets.all(0),
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
            ),
            onPressed:onPressed,
            icon: Icon(
              Icons.info_outline,
              color: AppColors.secondary,
              size: 30.sp,
            ),
          ),
        ),
      ],
    );
  }
}
