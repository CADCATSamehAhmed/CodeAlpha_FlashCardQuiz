import 'flash_card_model.dart';

class QuizModel {
  late String quizCategory;
  late String title;
  late List<FlashCardModel> questions;

  QuizModel(
      this.quizCategory,
      this.title,
      this.questions,
    );

  Map<String, dynamic> toMap() {
    return {
      'quizCategory': quizCategory,
      'title': title,
      'questions': questions,
    };
  }
}
