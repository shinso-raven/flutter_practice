import 'package:flutter/material.dart';
import 'package:jordan_store/controllers/store_controller.dart';
import 'package:jordan_store/screens/landing_screen.dart';
import 'package:jordan_store/screens/store_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StoreController _storeController = StoreController();

  Widget getCurrentScreen() {
    return !_storeController.onLandingScreen
        ? LandingScreen(
            storeController: _storeController,
          )
        : StoreScreen(
            storeController: _storeController,
          );
  }

  @override
  Widget build(BuildContext context) {
    _storeController = Provider.of<StoreController>(context);
    return getCurrentScreen();
  }
}
