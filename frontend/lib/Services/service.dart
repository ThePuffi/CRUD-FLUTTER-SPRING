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
    List responseList = jsonDecode(response.body);
    List<Todo> todos = [];
    for (Map todoMap in responseList) {
      Todo todo = Todo.fromMap(todoMap);
      todos.add(todo);
    }
    return todos;
  }

  static Future<Todo> updateTodo(
      {required String id,
      required String title,
      required String content}) async {
    Map data = {"id": id, "title": title, "content": content};
    var body = json.encode(data);
    var url = Uri.parse('$baseURL/update');
    http.Response response = await http.put(url, headers: headers, body: body);

    Map responseMap = jsonDecode(response.body);
    Todo todo = Todo.fromMap(responseMap);

    return todo;
  }

  static Future<http.Response> deleteTodo(String id) async {
    var url = Uri.parse('$baseURL/delete/$id');
    http.Response response = await http.delete(
      url,
      headers: headers,
    );
    return response;
  }
}
