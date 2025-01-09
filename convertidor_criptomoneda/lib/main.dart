import 'package:convertidor_criptomoneda/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CriptoApp());
}

class CriptoApp extends StatelessWidget {
  const CriptoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // title: 'Cripto converter',
        theme: ThemeData.dark().copyWith(
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            primaryColor: Colors.lightBlue,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(backgroundColor: Colors.lightBlue)),
        home: HomeScreen());
  }
}
