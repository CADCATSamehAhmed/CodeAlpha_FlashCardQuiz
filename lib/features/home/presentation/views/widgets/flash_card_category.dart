import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flash_card_quiz/features/quiz/data/models/flash_card_model.dart';
import 'package:flash_card_quiz/features/quiz/presentation/views/quiz_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlashCardCategory extends StatelessWidget {
  final List<FlashCardModel> flashCardsList;
  final IconData iconData;
  final String label;

  const FlashCardCategory(
      {super.key,
      required this.iconData,
      required this.label,
      required this.flashCardsList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10).w,
      child: GestureDetector(
        onTap: () {
          if (flashCardsList.isNotEmpty) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => QuizView(
                  flashCardsList: flashCardsList,
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                dismissDirection: DismissDirection.startToEnd,
                margin: EdgeInsets.all(20.w),
                padding: EdgeInsets.all(10.w),
                duration: const Duration(seconds: 3),
                backgroundColor: AppColors.mainColor,
                content: Text(
                  'There is No Flash cards in $label Category yet!',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
              ),
            );
          }
        },
        child: Container(
          height: 150.h,
          width: 150.w,
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
                size: 40.sp,
                color: AppColors.mainColor,
              ),
              SizedBox(height: 5.h),
              Text(
                label,
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
