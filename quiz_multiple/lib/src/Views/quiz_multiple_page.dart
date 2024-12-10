import 'package:flutter/material.dart';
import 'package:quiz_multiple/src/Models/question.dart';
import 'package:quiz_multiple/src/Views/result_screen.dart';
import 'package:quiz_multiple/src/Views/test_page.dart';

class QuizMultiplePage extends StatelessWidget {
  QuizMultiplePage({super.key});

  List<String> selectAnswers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade600,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/quiz-logo.png"),
              width: 200,
              color: Colors.white.withOpacity(0.6),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Learn Flutter the fun way",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(
              height: 40,
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TestPage(onSelectAnswer: (answer) {
                        selectAnswers.add(answer);
// selectAnswers.length == questions.length
                        print(selectAnswers.length);
                        if (selectAnswers.length > questions.length - 2) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ResulScreen(
                                    chosenAnswers: selectAnswers,
                                    onRestart: () {
                                      //Reiniciar pantalla

                                      selectAnswers = [];
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  QuizMultiplePage()));
                                    },
                                  )));
                        }
                      }),
                    ),
                  );
                },
                child: Text(
                  "Iniciar",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ))
          ],
        ),
      ),
    );
  }
}
