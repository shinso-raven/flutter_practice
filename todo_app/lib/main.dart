import 'package:flutter/material.dart';
import 'package:todo_app/todo_app.dart';

void main() {
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ToDo',
        theme: ThemeData(
          primaryColor: Colors.yellow,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
        ),
        home: TodoApp());
  }
}
