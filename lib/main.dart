import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/screen/todo_list_screen.dart';
import '../provider/todo_provider.dart';
import 'package:todo_list_provider/model/Todo.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TodoProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do-List',
      theme: ThemeData(primaryColor: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => TodoListScreen(),
      },
    );
  }
}
