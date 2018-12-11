import 'package:flutter/material.dart';
import 'package:imageloading/navigate_data/pojo/Todo.dart';
import 'package:imageloading/navigate_data/screens/ToDoList.dart';

void main() {
  runApp(MaterialApp(
    title: 'Passing Data',
    home: TodosScreen(
      todos: List.generate(
        40,
        (i) => Todo(
              'Todo $i',
              'A description of what needs to be done for Todo $i',
            ),
      ),
    ),
  ));
}
