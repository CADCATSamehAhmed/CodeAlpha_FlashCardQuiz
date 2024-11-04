import 'package:flash_card_quiz/core/shared_widgets/default_appbar.dart';
import 'package:flash_card_quiz/features/add_flashcard/presentation/views/widgets/add_flashcard_body.dart';
import 'package:flutter/material.dart';

class AddFlashCardView extends StatelessWidget {
  final String category;
  const AddFlashCardView({super.key, required this.category,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppbar(title: 'Add New Flashcard'),
      body: AddFlashCardBody(category: category,),
    );
  }
}
