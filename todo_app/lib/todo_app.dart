import 'package:flutter/material.dart';
import 'package:todo_app/alert_dialog.dart';
import 'package:todo_app/todo_tile.dart';

class TodoApp extends StatefulWidget {
  TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List toDoLIst = [
    ['Dar clases', false],
    ['Ir a la oficina', false],
  ];

  final TextEditingController controller = TextEditingController();

  //Funcion para controlar checkbox

  void checkBoxChanged(bool? valure, int index) {
    setState(() {
      toDoLIst[index][1] = valure;
    });
  }

  //Crear un nuevo ToDo
  void createNewTask() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return DialogBox(
            controller: controller,
            onSave: saveNewTask,
            oncCancel: () => {
              setState(() {
                Navigator.of(context).pop;
              })
            }, //Cierra la ventan y la saca de la pila del stack
          );
        });
  }

  //Guardar una nueva tarea
  saveNewTask() {
    setState(() {
      toDoLIst.add([controller.text, false]);
      Navigator.of(context).pop();
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade200,
        title: Text('To Do'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: toDoLIst.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoLIst[index][0],
            taskCompleted: toDoLIst[index][1],
            onChanged: (value) {
              checkBoxChanged(value, index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        shape: CircleBorder(eccentricity: 1),
        backgroundColor: Colors.yellow,
        onPressed: () {
          createNewTask();
        },
      ),
    );
  }
}
