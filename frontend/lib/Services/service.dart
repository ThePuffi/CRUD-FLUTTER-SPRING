import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:frontend/Models/todo.dart';

import 'globals.dart';

class Service {
  static Future<Todo> addTodo(String title, String content) async {
    Map data = {"title": title, "content": content};
    var body = json.encode(data);
    var url = Uri.parse('$baseURL/create');

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    Map responseMap = jsonDecode(response.body);
    Todo todo = Todo.fromMap(responseMap);

    return todo;
  }

  static Future<List<Todo>> getTodos() async {
    var url = Uri.parse('$baseURL/getAll');
    http.Response response = await http.get(
      url,
      headers: headers,
    );
    print(response.body);
    List responseList = jsonDecode(response.body);
    List<Todo> todos = [];
    for (Map todoMap in responseList) {
      Todo todo = Todo.fromMap(todoMap);
      todos.add(todo);
    }
    return todos;
  }

  static Future<http.Response> updateTodo(Todo todo) async {
    var url = Uri.parse('$baseURL/update');
    http.Response response = await http.put(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> deleteTodo(String id) async {
    var url = Uri.parse('$baseURL/delete/$id');
    http.Response response = await http.delete(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }
}
