import 'package:hive/hive.dart';
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

@HiveType(typeId: 0)
class QuizHiveModel extends HiveObject {

  @HiveField(0)
  late String title;

  @HiveField(1)
  late List<FlashCardModel> questions;
}
