import 'package:baseon/features/todo/bloc/todo_bloc.dart';
import 'package:baseon/features/todo/bloc/todo_event.dart';
import 'package:baseon/features/todo/bloc/todo_state.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TodoBloc loads, adds and toggles todos', () async {
    final repository = TodoRepositoryImpl(InMemoryTodoDataSource());
    final bloc = TodoBloc(
      getTodos: GetTodos(repository),
      addTodo: AddTodo(repository),
      toggleTodo: ToggleTodo(repository),
    );
    addTearDown(bloc.close);

    bloc.add(const TodoStarted());
    await expectLater(
      bloc.stream,
      emitsInOrder([
        isA<TodoState>().having(
          (state) => state.status,
          'status',
          TodoStatus.loading,
        ),
        isA<TodoState>().having((state) => state.todos.length, 'todo count', 1),
      ]),
    );

    bloc.add(const TodoAdded('Viết feature mới'));
    await expectLater(
      bloc.stream,
      emits(
        isA<TodoState>().having((state) => state.todos.length, 'todo count', 2),
      ),
    );
  });
}
