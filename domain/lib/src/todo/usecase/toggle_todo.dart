import '../entity/todo.dart';
import '../repository/todo_repository.dart';
import 'package:shared/shared.dart';

class ToggleTodo {
  const ToggleTodo(this._repository);

  final TodoRepository _repository;

  Future<Result<Todo>> call(String id) => _repository.toggleTodo(id);
}
