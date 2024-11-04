import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: 300.w,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(20).h,
      padding: const EdgeInsets.all(20).w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child:Text(
        question,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.secondary,
          fontSize: 30.sp,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }
}
