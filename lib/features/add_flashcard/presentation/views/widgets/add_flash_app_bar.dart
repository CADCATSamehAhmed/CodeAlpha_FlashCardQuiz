import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddFlashCardAppBar extends StatelessWidget {
  const AddFlashCardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 30.h, 0, 15.h),
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
            'Add New Flashcard',
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
