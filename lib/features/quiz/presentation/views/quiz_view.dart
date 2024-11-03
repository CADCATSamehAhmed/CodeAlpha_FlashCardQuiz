import 'package:flash_card_quiz/features/quiz/data/models/quiz_model.dart';
import 'package:flash_card_quiz/features/quiz/presentation/views/widgets/quiz_body.dart';
import 'package:flutter/material.dart';

class QuizView extends StatelessWidget {
  final QuizModel quizModel;
  const QuizView({super.key, required this.quizModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuizBody(quizModel: quizModel),
    );
  }
}
