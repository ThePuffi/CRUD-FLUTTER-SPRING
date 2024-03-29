class Todo {
  final String id;
  String title;
  String content;

  Todo({required this.id, required this.title, required this.content});

  factory Todo.fromMap(Map todoMap) {
    return Todo(
        id: todoMap["id"],
        title: todoMap["title"],
        content: todoMap["content"]);
  }
}
