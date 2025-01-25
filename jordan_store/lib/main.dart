import 'package:flutter/material.dart';
import 'package:jordan_store/controllers/store_controller.dart';
import 'package:jordan_store/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Jordan Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
          useMaterial3: true,
        ),
        home: ChangeNotifierProvider(
          create: (context) => StoreController(),
          child: HomeScreen(),
        ));
  }
}
