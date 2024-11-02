import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flash_card_quiz/features/quiz/data/models/quiz_model.dart';
import 'package:flash_card_quiz/features/quiz/presentation/views/quiz_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlashCardCategory extends StatelessWidget {
  final QuizModel quizModel;
  final IconData iconData;
  final String label;

  const FlashCardCategory(
      {super.key, required this.iconData, required this.label, required this.quizModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10).w,
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => QuizView(quizModel: quizModel,),
            ),
          );
        },
        child: Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.r),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 30.sp,
                color: AppColors.mainColor,
              ),
              SizedBox(height: 5.h),
              Text(
                label,
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
