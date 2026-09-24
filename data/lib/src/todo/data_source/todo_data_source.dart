import '../model/todo_dto.dart';

abstract interface class TodoDataSource {
  Future<List<TodoDto>> getTodos();

  Future<TodoDto> addTodo(String title);

  Future<TodoDto> toggleTodo(String id);
}
