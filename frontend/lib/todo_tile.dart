import 'package:flutter/material.dart';
import 'package:frontend/Models/todo_data.dart';

import 'Models/todo.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  final TodoData todoData;

  const TodoTile({Key? key, required this.todo, required this.todoData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          todo.title,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            todoData.deleteTodo(todo);
          },
        ),
      ),
    );
  }
}
