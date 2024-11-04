import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flash_card_quiz/features/add_flashcard/presentation/views/select_category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFloatingButton extends StatelessWidget {
  final int index;

  const HomeFloatingButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'FloatingActionButtonHeroTag',
      tooltip: 'FloatingActionButtonTooltip',
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SelectCategoryView(),
          ),
        );
      },
      backgroundColor: Colors.white,
      shape: const CircleBorder(),
      child: Container(
        margin: const EdgeInsets.all(10).r,
        padding: const EdgeInsets.all(10).w,
        height: 50.w,
        width: 50.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: AppColors.mainColor,
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 20.sp,
          ),
        ),
      ),
    );
  }
}
