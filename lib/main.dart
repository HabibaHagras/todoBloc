import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_todo_page.dart';
import 'todo_bloc.dart';
import 'todo_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => TodoBloc()..add(LoadTodos()),
        child: TodoListPage(),
      ),
      routes: {
        '/addTodo': (context) => AddTodoPage(),
      },
    );
  }
}
