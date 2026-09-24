import '../entity/todo.dart';
import 'package:shared/shared.dart';

abstract interface class TodoRepository {
  Future<Result<List<Todo>>> getTodos();

  Future<Result<Todo>> addTodo(String title);

  Future<Result<Todo>> toggleTodo(String id);
}
