import 'package:animate_do/animate_do.dart';
import 'package:flash_card_quiz/features/quiz/data/models/flash_card_model.dart';
import 'package:flash_card_quiz/features/quiz/presentation/views/widgets/answer_card.dart';
import 'package:flash_card_quiz/features/quiz/presentation/views/widgets/question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'result_body.dart';

class FlashCard extends StatefulWidget {
  final List<FlashCardModel> flashCardsList;
  final ValueNotifier<int> questionIndexNotifier;
  final ValueNotifier<int> score;

  const FlashCard(
      {super.key,
      required this.flashCardsList,
      required this.questionIndexNotifier,
      required this.score});

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  bool showAnswer = false;
  int choose = -1;
  int currentQuestionIndex = 0;
  List<String> answers = [];

  @override
  void initState() {
    super.initState();
    currentQuestionIndex = widget.questionIndexNotifier.value;
    answers = widget.flashCardsList[currentQuestionIndex].wrongAnswers;
    answers.add(widget.flashCardsList[currentQuestionIndex].rightAnswer);
  }

  void questionPlus() {
    if (currentQuestionIndex < widget.flashCardsList.length - 1) {

      Future.delayed(
        const Duration(seconds: 2),
      ).then((value) {
        widget.questionIndexNotifier.value = currentQuestionIndex + 1;
      });
    } else {
      Future.delayed(
        const Duration(seconds: 2),
      ).then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultBody(
              score: widget.score.value,
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    answers.shuffle();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeInDown(
          child: QuestionCard(
            question: widget.flashCardsList[currentQuestionIndex].question,
            onPressed: () {
              setState(() {
                showAnswer = true;
              });
            },
          ),
        ),
        SizedBox(height: 30.h),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    showAnswer = true;
                    choose = index;
                  });
                  questionPlus();
                },
                child: FadeInLeft(
                  child: AnswerCard(
                    answer: answers[index],
                    correctAnswer: widget.flashCardsList[currentQuestionIndex].rightAnswer,
                    isPressed: showAnswer,
                    choose: choose,
                    index: index,
                    score: widget.score,
                  ),
                ),
              );
            }),
      ],
    );
  }
}
