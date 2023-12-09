import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'todo_bloc.dart';

class AddTodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                // Handle text input
              },
              decoration: InputDecoration(
                labelText: 'Todo',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final todo = 'Get the todo from the text field'; // Replace this line
                context.read<TodoBloc>().add(AddTodo(todo));
                Navigator.pop(context);
              },
              child: Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
