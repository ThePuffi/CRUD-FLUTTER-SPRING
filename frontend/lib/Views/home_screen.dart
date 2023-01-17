import 'package:flutter/material.dart';
import 'package:frontend/Models/todo.dart';
import 'package:frontend/Models/todo_data.dart';
import 'package:frontend/Services/service.dart';
import 'package:frontend/Views/add_todo_screen.dart';
import 'package:provider/provider.dart';

import '../todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo>? todos;

  getTodos() async {
    todos = await Service.getTodos();
    // ignore: use_build_context_synchronously
    Provider.of<TodoData>(context, listen: false).todos = todos!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return todos == null
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'Todo Tasks (${Provider.of<TodoData>(context).todos.length})',
              ),
              centerTitle: true,
              backgroundColor: Colors.blue,
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Consumer<TodoData>(
                builder: (context, todoData, child) {
                  return ListView.builder(
                      itemCount: todoData.todos.length,
                      itemBuilder: (context, index) {
                        Todo todo = todoData.todos[index];
                        return TodoTile(
                          todo: todo,
                          todoData: todoData,
                        );
                      });
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.add,
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const AddTodoScreen();
                    });
              },
            ),
          );
  }
}
