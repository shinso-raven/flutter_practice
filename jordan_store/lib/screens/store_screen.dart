import 'package:flutter/material.dart';
import 'package:jordan_store/controllers/store_controller.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({super.key, required this.storeController});

  final StoreController storeController;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Store screen"));
  }
}
