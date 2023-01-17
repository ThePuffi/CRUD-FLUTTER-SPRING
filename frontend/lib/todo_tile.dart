import 'package:flutter/material.dart';
import 'package:frontend/Models/todo_data.dart';

import 'Models/todo.dart';
import 'Views/update_todo_screen.dart';

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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    print(todo);
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return UpdateTodoScreen(todo: todo);
                        });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    todoData.deleteTodo(todo);
                  },
                ),
              ],
            )));
  }
}
