import 'dart:ffi';

class Question {
  Question(
      {required this.question,
      required this.correctAnswer,
      required this.options});

  String question;
  int chosenAnswer = -1;
  int correctAnswer;
  List<Answer> options;
}

class Answer {
  String option;
  Int id;

  Answer({required this.option, required this.id});
}
