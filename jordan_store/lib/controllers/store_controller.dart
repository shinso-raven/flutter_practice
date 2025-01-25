import 'package:flutter/material.dart';

class StoreController with ChangeNotifier {
  bool onLandingScreen = false;

  void ShopNow() {
    onLandingScreen = true;
    print(onLandingScreen);
    notifyListeners();
  }
}
