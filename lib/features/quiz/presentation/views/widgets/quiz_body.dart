import 'package:flash_card_quiz/features/quiz/presentation/views/widgets/flash_card.dart';
import 'package:flash_card_quiz/features/quiz/presentation/views/widgets/quiz_app_bar.dart';
import 'package:flutter/material.dart';

class QuizBody extends StatelessWidget {
  final String appbarTitle;
  const QuizBody({super.key, required this.appbarTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuizAppBar(title: appbarTitle),
        const Center(
          child:FlashCard(index: 1),
        )
      ],
    );
  }
}
