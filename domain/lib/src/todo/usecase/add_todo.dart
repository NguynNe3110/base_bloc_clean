import '../entity/todo.dart';
import '../repository/todo_repository.dart';
import 'package:shared/shared.dart';

class AddTodo {
  const AddTodo(this._repository);

  final TodoRepository _repository;

  Future<Result<Todo>> call(String title) {
    final normalizedTitle = title.trim();
    if (normalizedTitle.isEmpty) {
      return Future.value(
        const Result.failure(
          AppException('Nội dung công việc không được để trống.'),
        ),
      );
    }
    return _repository.addTodo(normalizedTitle);
  }
}
