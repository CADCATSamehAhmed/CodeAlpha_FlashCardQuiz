import 'package:flash_card_quiz/features/quiz/data/models/quiz_model.dart';
import 'package:flash_card_quiz/features/quiz/presentation/views/widgets/flash_card.dart';
import 'package:flash_card_quiz/features/quiz/presentation/views/widgets/quiz_app_bar.dart';
import 'package:flash_card_quiz/features/quiz/presentation/views/widgets/quiz_footer.dart';
import 'package:flutter/material.dart';

class QuizBody extends StatefulWidget {
  final QuizModel quizModel;

  const QuizBody({super.key, required this.quizModel});

  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  final ValueNotifier<int> quizIndex = ValueNotifier<int>(0);
  final ValueNotifier<int> score = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuizAppBar(title: widget.quizModel.quizCategory),
        FlashCard(
          flashCardsList: widget.quizModel.questions, questionIndexNotifier: quizIndex, score: score,
        ),
        ValueListenableBuilder<int>(
            valueListenable: quizIndex,
            builder: (context, showAnswer, child) {
              return QuizFooter(
                currentFlashCardIndex: quizIndex.value,
                flashCardsLNumber: widget.quizModel.questions.length,
              );
            },
        ),
      ],
    );
  }
}
