import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerCard extends StatelessWidget {
  final String answer;
  final String correctAnswer;
  final bool isPressed;
  final int choose;
  final int index;
  final ValueNotifier<int> score;

  const AnswerCard(
      {super.key,
      required this.answer,
      required this.correctAnswer,
      required this.isPressed,
      required this.choose,
      required this.index, required this.score});

  @override
  Widget build(BuildContext context) {
    // if(choose == index){
    //   score.value=score.value+5;
    // }
    return Container(
      constraints: BoxConstraints(minHeight: 50.h),
      width: 300.w,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10).w,
      padding: const EdgeInsets.all(10).w,
      decoration: BoxDecoration(
        color: (choose == index || (answer == correctAnswer && isPressed))
            ? (answer == correctAnswer && isPressed)
                ? Colors.green.shade400
                : Colors.red
            : AppColors.mainColor,
        borderRadius: BorderRadius.circular(30).r,
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
