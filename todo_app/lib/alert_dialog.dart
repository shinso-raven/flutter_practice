import 'package:flutter/material.dart';
import 'package:todo_app/my_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.oncCancel,
  });

  final TextEditingController controller;

  final VoidCallback oncCancel;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add New Task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  label: "Add",
                  onPress: onSave,
                ),
                MyButton(
                  label: "Cancel",
                  onPress: oncCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
