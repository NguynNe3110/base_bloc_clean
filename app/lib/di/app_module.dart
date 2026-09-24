import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../features/todo/bloc/todo_bloc.dart';
import '../navigation/app_router.dart';

@module
abstract class AppModule {
  @lazySingleton
  AppRouter appRouter() => AppRouter();

  @lazySingleton
  TodoDataSource todoDataSource() => InMemoryTodoDataSource();

  @lazySingleton
  TodoRepository todoRepository(TodoDataSource source) =>
      TodoRepositoryImpl(source);

  @factoryMethod
  GetTodos getTodos(TodoRepository repository) => GetTodos(repository);

  @factoryMethod
  AddTodo addTodo(TodoRepository repository) => AddTodo(repository);

  @factoryMethod
  ToggleTodo toggleTodo(TodoRepository repository) => ToggleTodo(repository);

  @factoryMethod
  TodoBloc todoBloc(GetTodos get, AddTodo add, ToggleTodo toggle) =>
      TodoBloc(getTodos: get, addTodo: add, toggleTodo: toggle);
}
