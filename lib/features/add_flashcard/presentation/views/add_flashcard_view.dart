import 'package:flash_card_quiz/features/add_flashcard/presentation/views/widgets/add_flashcard_body.dart';
import 'package:flutter/material.dart';

class AddFlashCardView extends StatelessWidget {
  const AddFlashCardView({super.key,});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddFlashCardBody(),
    );
  }
}
