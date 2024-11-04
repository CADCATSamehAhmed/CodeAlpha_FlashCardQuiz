import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizFooter extends StatelessWidget {
  final int currentFlashCardIndex;
  final int flashCardsLNumber;

  const QuizFooter({
    super.key,
    required this.currentFlashCardIndex,
    required this.flashCardsLNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30,0,30,30).h,
      child: Column(
        children: [
          Text(
            "$currentFlashCardIndex / $flashCardsLNumber",
            style: TextStyle(
              color: AppColors.secondary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5.h,),
          LinearProgressIndicator(
            value: currentFlashCardIndex / flashCardsLNumber,
            color: AppColors.mainColor,
            minHeight: 7,
            backgroundColor: AppColors.mainColor.withOpacity(0.5),
          )
        ],
      ),
    );
  }
}
