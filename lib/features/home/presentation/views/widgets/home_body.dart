import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flash_card_quiz/features/home/presentation/view_model/home_cubit.dart';
import 'package:flash_card_quiz/features/home/presentation/views/widgets/flash_card_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
      child: Wrap(
        children: [
          FlashCardCategory(
            iconData: Icons.functions_sharp,
            label: 'Mathematics',
            flashCardsList: homeCubit.mathList,
          ),
          FlashCardCategory(
            iconData: Icons.science,
            label: 'Science',
            flashCardsList: homeCubit.scienceList,
          ),
          FlashCardCategory(
            iconData: Icons.temple_hindu_sharp,
            label: 'history',
            flashCardsList: homeCubit.historyList,
          ),
          FlashCardCategory(
            iconData: Icons.translate_outlined,
            label: 'language',
            flashCardsList: homeCubit.languageList,
          ),
          FlashCardCategory(
            iconData: Icons.quiz_outlined,
            label: 'other',
            flashCardsList: homeCubit.otherList,
          ),
          FlashCardCategory(
            iconData: Icons.computer,
            label: 'Computer',
            flashCardsList: homeCubit.computerList,
          ),
        ],
      ),
    );
  }
}
