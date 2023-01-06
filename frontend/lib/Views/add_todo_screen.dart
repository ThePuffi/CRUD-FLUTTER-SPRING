import 'package:flutter/material.dart';
import 'package:frontend/Models/todo_data.dart';
import 'package:provider/provider.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  String todoTitle = "";
  String content = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const Text(
            'Add Todo',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.green,
            ),
          ),
          TextField(
            autofocus: true,
            onChanged: (val) {
              todoTitle = val;
            },
          ),
          TextField(
            autofocus: true,
            onChanged: (val) {
              content = val;
            },
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              if (todoTitle.isNotEmpty) {
                Provider.of<TodoData>(context, listen: false)
                    .addTodo(todoTitle, content);
                Navigator.pop(context);
              }
            },
            style: TextButton.styleFrom(backgroundColor: Colors.green),
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
