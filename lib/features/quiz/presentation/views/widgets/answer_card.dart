import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerCard extends StatelessWidget {
  final String answer;
  final String correctAnswer;
  final bool isPressed;
  final int selectedAnswerIndex;
  final int index;
  final ValueNotifier<int> score;

  const AnswerCard({
    super.key,
    required this.answer,
    required this.correctAnswer,
    required this.isPressed,
    required this.selectedAnswerIndex,
    required this.index,
    required this.score,
  });

  Color _getBackgroundColor() {
    if (selectedAnswerIndex == index || (answer == correctAnswer && isPressed)) {
      return (answer == correctAnswer && isPressed) ? Colors.green.shade400 : Colors.red;
    }
    return AppColors.mainColor;
  }

  void _checkForCorrectAnswer() {
    if (answer == correctAnswer && isPressed && selectedAnswerIndex == index) {
      score.value++;
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkForCorrectAnswer();
    return Container(
      constraints: BoxConstraints(minHeight: 50.h),
      width: 300.w,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical:5.h,horizontal: 30.w),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(25).r,
        boxShadow:  const [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 0.5,
            blurRadius: 6,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Text(
        answer,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.sp,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }
}
