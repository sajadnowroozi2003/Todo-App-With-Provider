import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/provider/todo_provider.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: ListView.builder(
        itemCount: todoProvider.todos.length,
        itemBuilder: (ctx, index) {
          final todo = todoProvider.todos[index];
          return ListTile(
            title: Text(todo.title),
            trailing: Checkbox(
              value: todo.isCompleted,
              onChanged: (_) {
                todoProvider.toggleTodoStatus(todo.id);
              },
            ),
            onLongPress: () {
              showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    title: const Text('Delete Todo'),
                    content: const Text(
                        'Are you sure you want to delete this todo?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          todoProvider.deleteTodo(todo.id);
                          Navigator.of(ctx).pop();
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) {
              String newTodoTitle = '';
              return AlertDialog(
                title: const Text('Add New Todo'),
                content: TextField(
                  onChanged: (value) {
                    newTodoTitle = value;
                  },
                  decoration:
                      const InputDecoration(hintText: 'Enter todo title'),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (newTodoTitle.isNotEmpty) {
                        todoProvider.addTodo(newTodoTitle);
                        Navigator.of(ctx).pop();
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
