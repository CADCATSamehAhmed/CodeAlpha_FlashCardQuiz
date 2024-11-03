import 'package:flash_card_quiz/features/home/presentation/view_model/home_cubit.dart';
import 'package:flash_card_quiz/features/home/presentation/views/widgets/flash_card_category.dart';
import 'package:flash_card_quiz/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flash_card_quiz/features/quiz/data/models/quiz_model.dart';
import 'package:flutter/material.dart';
import 'text_row.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return Column(
      children: [
        const HomeAppBar(),
        const TextRow(),
        Wrap(
          children: [
            FlashCardCategory(
              iconData: Icons.functions_sharp,
              label: 'Mathematics',
              quizModel:
                  QuizModel('Mathematics', 'Mathematics', homeCubit.mathList),
            ),
            FlashCardCategory(
              iconData: Icons.science,
              label: 'Science',
              quizModel: QuizModel('Science', 'Science', homeCubit.scienceList),
            ),
            FlashCardCategory(
              iconData: Icons.temple_hindu_sharp,
              label: 'history',
              quizModel: QuizModel('history', 'history', homeCubit.historyList),
            ),
            FlashCardCategory(
              iconData: Icons.translate_outlined,
              label: 'language',
              quizModel:
                  QuizModel('language', 'language', homeCubit.languageList),
            ),
            FlashCardCategory(
              iconData: Icons.business_center_sharp,
              label: 'Business',
              quizModel:
                  QuizModel('Business', 'Business', homeCubit.businessList),
            ),
            FlashCardCategory(
              iconData: Icons.computer,
              label: 'Computer',
              quizModel:
                  QuizModel('Computer', 'Computer', homeCubit.computerList),
            ),
          ],
        ),
      ],
    );
  }
}
