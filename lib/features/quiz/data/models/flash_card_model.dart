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

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'rightAnswer': rightAnswer,
      'wrongAnswers': wrongAnswers,
      'questionScore': questionScore,
    };
  }
}
