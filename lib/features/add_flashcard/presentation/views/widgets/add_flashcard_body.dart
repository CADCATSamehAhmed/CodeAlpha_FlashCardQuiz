import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flash_card_quiz/features/add_flashcard/presentation/views/widgets/accept_button.dart';
import 'package:flash_card_quiz/features/add_flashcard/presentation/views/widgets/add_flash_app_bar.dart';
import 'package:flash_card_quiz/features/home/presentation/view_model/home_cubit.dart';
import 'package:flash_card_quiz/features/quiz/data/models/flash_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'question_field.dart';
import 'answer_field.dart';

class AddFlashCardBody extends StatefulWidget {
  const AddFlashCardBody({super.key});

  @override
  State<AddFlashCardBody> createState() => _AddFlashCardBodyState();
}

class _AddFlashCardBodyState extends State<AddFlashCardBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController questionController = TextEditingController();
  TextEditingController correctAnswerController = TextEditingController();
  TextEditingController wrongA1Controller = TextEditingController();
  TextEditingController wrongA2Controller = TextEditingController();
  TextEditingController wrongA3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: EdgeInsets.all(20.w),
        children: [
          const AddFlashCardAppBar(),
          Text(
            'Enter Question',
            style: TextStyle(color: AppColors.mainColor, fontSize: 20),
          ),
          QuestionField(controller: questionController),
          Text(
            'Enter Correct Answer',
            style: TextStyle(color: AppColors.mainColor, fontSize: 20),
          ),
          AnswerField(controller: correctAnswerController),
          Text(
            'Enter Wrong chooses',
            style: TextStyle(color: AppColors.mainColor, fontSize: 20),
          ),
          AnswerField(controller: wrongA1Controller),
          AnswerField(controller: wrongA2Controller),
          AnswerField(controller: wrongA3Controller),
          SizedBox(height: 10.h),
          BlocConsumer<HomeCubit, HomeStates>(
              listener: (context, state) {},
              builder: (context, state) {
                HomeCubit cubit = HomeCubit.get(context);
                return AcceptButton(onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    FlashCardModel flashCardModel = FlashCardModel(
                        questionController.text,
                        correctAnswerController.text,
                        [
                          wrongA1Controller.text,
                          wrongA2Controller.text,
                          wrongA3Controller.text
                        ],
                        5);
                    cubit.putFlashCard(3, '3_key_random', flashCardModel.toMap());
                  }
                });
              })
        ],
      ),
    );
  }
}
