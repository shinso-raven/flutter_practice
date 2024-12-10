// class Question {
//   Question(
//       {required this.question,
//       required this.correctAnswer,
//       required this.options});

//   String question;
//   int chosenAnswer = -1;
//   int correctAnswer;
//   List<Answer> options;
// }

// class Answer {
//   String option;
//   Int id;

//   Answer({required this.option, required this.id});
// }

class QuizQuestion {
  QuizQuestion(this.text, this.answer);
  final String text;
  final List<String> answer;

  List<String> getRandomAnswer() {
    final randomList = List.of(answer);
    randomList.shuffle();
    return randomList;
  }
}

List<QuizQuestion> questions = [
  QuizQuestion(
    'What are the main building blocks of Flutter UIs?',
    [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  QuizQuestion('How are Flutter UIs built?', [
    'By combining widgets in code',
    'By combining widgets in a visual editor',
    'By defining widgets in config files',
    'By using XCode for iOS and Android Studio for Android',
  ]),
  QuizQuestion(
    'What\'s the purpose of a StatefulWidget?',
    [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuizQuestion(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    [
      'StatelessWidget',
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuizQuestion(
    'What happens if you change data in a StatelessWidget?',
    [
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  // QuizQuestion(
  //   'How should you update data inside of StatefulWidgets?',
  //   [
  //     'By calling setState()',
  //     'By calling updateData()',
  //     'By calling updateUI()',
  //     'By calling updateState()',
  //   ],
  // ),
];
