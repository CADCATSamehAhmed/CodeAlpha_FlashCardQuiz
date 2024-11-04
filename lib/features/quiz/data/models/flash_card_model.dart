class FlashCardModel {
  late String category;
  late String flashCardId;
  late String question;
  late String rightAnswer;
  late List<String> wrongAnswers;
  late int questionScore;

  FlashCardModel(
      this.category,
      this.flashCardId,
      this.question,
      this.rightAnswer,
      this.wrongAnswers,
      this.questionScore,
      );

  FlashCardModel.fromMap(Map<dynamic, dynamic> data) {
    category = data['category'];
    flashCardId = data['flashCardId'];
    question = data['question'];
    rightAnswer = data['rightAnswer'];
    wrongAnswers = data['wrongAnswers'];
    questionScore = data['questionScore'];
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'category': category,
      'flashCardId': flashCardId,
      'question': question,
      'rightAnswer': rightAnswer,
      'wrongAnswers': wrongAnswers,
      'questionScore': questionScore,
    };
  }
}
