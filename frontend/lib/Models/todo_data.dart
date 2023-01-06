import 'package:flutter/cupertino.dart';
import 'package:frontend/Services/service.dart';
import 'todo.dart';

class TodoData extends ChangeNotifier {
  List<Todo> todos = [];

  void addTodo(String todoTitle, String content) async {
    Todo todo = await Service.addTodo(todoTitle, content);
    todos.add(todo);
    notifyListeners();
  }

  void updateTodo(Todo todo) {
    Service.updateTodo(todo);
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    todos.remove(todo);
    Service.deleteTodo(todo.id);
    notifyListeners();
  }
}
