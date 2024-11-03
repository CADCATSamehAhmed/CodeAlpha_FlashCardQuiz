import 'package:hive/hive.dart';

class FlashCardModel {
  late String question;
  late String rightAnswer;
  late List<String> wrongAnswers;
  late int questionScore;

  FlashCardModel(
      this.question,
      this.rightAnswer,
      this.wrongAnswers,
      this.questionScore,
      );

  FlashCardModel.fromMap(Map<dynamic, dynamic> data) {
    question = data['question'];
    rightAnswer = data['rightAnswer'];
    wrongAnswers = data['wrongAnswers'];
    questionScore = data['questionScore'];
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'question': question,
      'rightAnswer': rightAnswer,
      'wrongAnswers': wrongAnswers,
      'questionScore': questionScore,
    };
  }
}

@HiveType(typeId: 1)
class FlashCardHiveModel extends HiveObject {

  @HiveField(0)
  late String question;

  @HiveField(1)
  late String rightAnswer;

  @HiveField(2)
  late List<String> wrongAnswers;

  @HiveField(3)
  late int questionScore;}