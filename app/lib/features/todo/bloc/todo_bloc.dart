import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({
    required GetTodos getTodos,
    required AddTodo addTodo,
    required ToggleTodo toggleTodo,
  }) : _getTodos = getTodos,
       _addTodo = addTodo,
       _toggleTodo = toggleTodo,
       super(const TodoState()) {
    on<TodoStarted>(_onStarted);
    on<TodoAdded>(_onAdded);
    on<TodoToggled>(_onToggled);
  }

  final GetTodos _getTodos;
  final AddTodo _addTodo;
  final ToggleTodo _toggleTodo;

  Future<void> _onStarted(TodoStarted event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: TodoStatus.loading, errorMessage: null));
    final result = await _getTodos();
    switch (result) {
      case Success<List<Todo>>(:final data):
        emit(state.copyWith(status: TodoStatus.success, todos: data));
      case Failure<List<Todo>>(:final error):
        emit(
          state.copyWith(
            status: TodoStatus.failure,
            errorMessage: error.message,
          ),
        );
    }
  }

  Future<void> _onAdded(TodoAdded event, Emitter<TodoState> emit) async {
    final result = await _addTodo(event.title);
    switch (result) {
      case Success<Todo>(:final data):
        emit(state.copyWith(todos: [...state.todos, data], errorMessage: null));
      case Failure<Todo>(:final error):
        emit(state.copyWith(errorMessage: error.message));
    }
  }

  Future<void> _onToggled(TodoToggled event, Emitter<TodoState> emit) async {
    final result = await _toggleTodo(event.id);
    switch (result) {
      case Success<Todo>(:final data):
        final todos = state.todos
            .map((todo) => todo.id == data.id ? data : todo)
            .toList(growable: false);
        emit(state.copyWith(todos: todos, errorMessage: null));
      case Failure<Todo>(:final error):
        emit(state.copyWith(errorMessage: error.message));
    }
  }
}
