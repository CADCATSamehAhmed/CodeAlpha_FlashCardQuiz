import 'package:animate_do/animate_do.dart';
import 'package:flash_card_quiz/features/quiz/data/models/flash_card_model.dart';
import 'package:flash_card_quiz/features/quiz/presentation/views/widgets/answer_card.dart';
import 'package:flash_card_quiz/features/quiz/presentation/views/widgets/question_card.dart';
import 'package:flutter/material.dart';
import 'result_body.dart';

class FlashCard extends StatefulWidget {
  final List<FlashCardModel> flashCardsList;
  final ValueNotifier<int> questionIndexNotifier;
  final ValueNotifier<int> score;

  const FlashCard({
    super.key,
    required this.flashCardsList,
    required this.questionIndexNotifier,
    required this.score,
  });

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  bool showAnswer = false;
  int selectedAnswerIndex = -1;
  int currentQuestionIndex = 0;
  List<String> answers = [];

  @override
  void initState() {
    super.initState();
    _initializeQuestion();
  }

  void _initializeQuestion() {
    currentQuestionIndex = widget.questionIndexNotifier.value;
    answers = [
      ...widget.flashCardsList[currentQuestionIndex].wrongAnswers,
      widget.flashCardsList[currentQuestionIndex].rightAnswer
    ]..shuffle();
  }

  void _goToNextQuestion() {
    Future.delayed(const Duration(seconds: 2), () {
      if (currentQuestionIndex < widget.flashCardsList.length - 1) {
        widget.questionIndexNotifier.value = ++currentQuestionIndex;
        setState(() {
          showAnswer = false;
          selectedAnswerIndex = -1;
          _initializeQuestion();
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultBody(score: widget.score.value),
          ),
        );
      }
    });
  }

  void _handleAnswerTap(int index) {
    setState(() {
      showAnswer = true;
      selectedAnswerIndex = index;
    });
    _goToNextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeInRight(
          child: QuestionCard(
            question: widget.flashCardsList[currentQuestionIndex].question,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: answers.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _handleAnswerTap(index),
              child: FadeInLeft(
                child: AnswerCard(
                  answer: answers[index],
                  correctAnswer: widget.flashCardsList[currentQuestionIndex].rightAnswer,
                  isPressed: showAnswer,
                  selectedAnswerIndex: selectedAnswerIndex,
                  index: index,
                  score: widget.score,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
