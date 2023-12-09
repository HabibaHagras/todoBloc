import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class TodoEvent extends Equatable {
   TodoEvent();
}

class LoadTodos extends TodoEvent {
  @override
  List<Object?> get props => [];
}

class AddTodo extends TodoEvent {
  final String todo;

  AddTodo(this.todo);

  @override
  List<Object?> get props => [todo];
}

// States
abstract class TodoState extends Equatable {
   TodoState();
}

class TodoInitial extends TodoState {
  @override
  List<Object?> get props => [];
}

class TodosLoaded extends TodoState {
  final List<String> todos;

  TodosLoaded(this.todos);

  @override
  List<Object?> get props => [todos];
}

// BLoC
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> _todos = [];

  @override
  TodoState get initialState => TodoInitial();

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is LoadTodos) {
      yield TodosLoaded(List.from(_todos));
    } else if (event is AddTodo) {
      _todos.add(event.todo);
      yield TodosLoaded(List.from(_todos));
    }
  }
}
