import 'package:flash_card_quiz/core/shared_widgets/default_appbar.dart';
import 'package:flash_card_quiz/features/quiz/data/models/flash_card_model.dart';
import 'package:flash_card_quiz/features/quiz/presentation/views/widgets/quiz_body.dart';
import 'package:flutter/material.dart';

class QuizView extends StatelessWidget {
  final List<FlashCardModel> flashCardsList;
  const QuizView({super.key, required this.flashCardsList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(title: flashCardsList[0].category),
      body: QuizBody(flashCardsList: flashCardsList),
    );
  }
}
