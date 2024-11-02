import 'package:flash_card_quiz/core/shared_widgets/custom_button.dart';
import 'package:flash_card_quiz/features/home/presentation/views/widgets/flash_card_category.dart';
import 'package:flash_card_quiz/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flash_card_quiz/features/quiz/data/models/quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'text_row.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            SizedBox(height: 200.h),
            const TextRow(),
            Wrap(
              children: [
                FlashCardCategory(
                  iconData: Icons.functions_sharp,
                  label: 'Mathematics',
                  quizModel: QuizModel('Mathematics', 'Mathematics', []),
                ),
                FlashCardCategory(
                  iconData: Icons.science,
                  label: 'Science',
                  quizModel: QuizModel('Science', 'Science', []),
                ),
                FlashCardCategory(
                  iconData: Icons.business_center_sharp,
                  label: 'Business',
                  quizModel: QuizModel('Science', 'Science', []),
                ),
                FlashCardCategory(
                  iconData: Icons.computer,
                  label: 'Computer',
                  quizModel: QuizModel('Computer', 'Computer', []),
                ),
              ],
            ),
            Wrap(
              spacing: 10.w,
              direction:Axis.vertical,
              children: [
                CustomButton(text: 'Get Quizzes', isPrime: true, onPressed: () {}),
                CustomButton(text: 'New Quiz', isPrime: false, onPressed: () {}),
              ],
            ),
          ],
        ),
        const HomeAppBar(),
      ],
    );
  }
}
