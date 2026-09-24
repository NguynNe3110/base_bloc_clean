import '../entity/todo.dart';
import '../repository/todo_repository.dart';
import 'package:shared/shared.dart';

class GetTodos {
  const GetTodos(this._repository);

  final TodoRepository _repository;

  Future<Result<List<Todo>>> call() => _repository.getTodos();
}
