import 'package:flutter/material.dart';
import 'package:quiz_multiple/src/Models/question.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
        backgroundColor: Colors.purple.shade600,
        body: Container(
          decoration: const BoxDecoration(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    currentQuestion.text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ...currentQuestion.getRandomAnswer().map((answer) {
                    return AnswerButton(
                        text: answer,
                        onTap: () {
                          answerQuestion(answer);
                        });
                  })
                ],
              ),
            ),
          ),
        ));
  }
}

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.text, required this.onTap});

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ));
  }
}
