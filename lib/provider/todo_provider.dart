import 'package:flutter/material.dart';
import '../provider/todo_provider.dart';
import 'package:todo_list_provider/model/Todo.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];
  List get todos => _todos;

  void addTodo(String title) {
    final newTodo = Todo(title: title, id: DateTime.now().toString());
    _todos.add(newTodo);
    notifyListeners();
  }

  void toggleTodoStatus(String id) {
    final todoIndex = _todos.indexWhere((todo) => todo.id == id);
    if (todoIndex >= 0) {
      _todos[todoIndex].isCompleted = !_todos[todoIndex].isCompleted!;
      notifyListeners();
    }
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
