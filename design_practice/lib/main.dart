import 'package:design_practice/Screens/home_screen.dart';
import 'package:design_practice/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          primaryColor: kbackGroundColor,
          scaffoldBackgroundColor: kbackGroundColor,
          appBarTheme: AppBarTheme(backgroundColor: kbackGroundColor)),
      home: const HomeScreen(title: 'BMI Calculator'),
    );
  }
}
