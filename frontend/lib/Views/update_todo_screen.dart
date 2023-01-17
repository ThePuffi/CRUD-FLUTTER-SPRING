import 'package:flutter/material.dart';
import 'package:frontend/Models/todo.dart';
import 'package:frontend/Models/todo_data.dart';
import 'package:provider/provider.dart';

class UpdateTodoScreen extends StatefulWidget {
  final Todo todo;
  const UpdateTodoScreen({Key? key, required this.todo}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UpdateTodoScreenState createState() => _UpdateTodoScreenState();
}

class _UpdateTodoScreenState extends State<UpdateTodoScreen> {
  late Todo _todo;

  @override
  void initState() {
    super.initState();

    _todo = widget.todo;
    print(_todo);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const Text(
            'Update Todo',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.blue,
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "Titel"),
            initialValue: _todo.title,
            autofocus: true,
            onChanged: (val) {
              _todo.title = val;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "Beschreibung"),
            initialValue: _todo.content,
            autofocus: true,
            onChanged: (val) {
              _todo.content = val;
            },
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Provider.of<TodoData>(context, listen: false).updateTodo(_todo);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
