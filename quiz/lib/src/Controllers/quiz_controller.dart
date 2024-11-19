import 'package:quiz/src/Models/question.dart';

class QuizController {
  List<Question> _questionBank = [
    Question(
        question:
            "Linus Sebastian is the creator of the Linux kernel, which went on to be used in Linux, Android, and Chrome OS.",
        answer: false),
    Question(
        question:
            "The open source program Redis is a relational database server.",
        answer: false),
    Question(
        question: "&quot;Windows NT&quot; is a monolithic kernel.",
        answer: false)
  ];

  int questionNumber = 0;

  bool NextQuestion() {
    if (questionNumber < _questionBank.length - 1) {
      questionNumber++;
      return true;
    }
    return false;
  }

  void RestartQuiz() {
    questionNumber = 0;
  }

  String GetQuestionText() {
    return _questionBank[questionNumber].question;
  }

  bool GetCorrectAnswer() {
    return _questionBank[questionNumber].answer;
  }
}
