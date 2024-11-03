import 'package:flash_card_quiz/core/shared_widgets/default_form_field.dart';
import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionField extends StatelessWidget {
  final TextEditingController controller;

  const QuestionField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5).w,
      child: DefaultFormField(
        controller: controller,
        type: TextInputType.text,
        validate: (v) {
          return null;
        },
        filledColor:AppColors.mainColor,
      ),
    );
  }
}
