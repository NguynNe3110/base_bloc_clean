import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

import '../data_source/todo_data_source.dart';

class TodoRepositoryImpl implements TodoRepository {
  const TodoRepositoryImpl(this._dataSource);
  final TodoDataSource _dataSource;

  @override
  Future<Result<List<Todo>>> getTodos() async {
    try {
      final items = await _dataSource.getTodos();
      return Result.success(
        items.map((item) => item.toEntity()).toList(growable: false),
      );
    } on Object catch (error) {
      return Result.failure(AppException.from(error));
    }
  }

  @override
  Future<Result<Todo>> addTodo(String title) async {
    try {
      final item = await _dataSource.addTodo(title);
      return Result.success(item.toEntity());
    } on Object catch (error) {
      return Result.failure(AppException.from(error));
    }
  }

  @override
  Future<Result<Todo>> toggleTodo(String id) async {
    try {
      final item = await _dataSource.toggleTodo(id);
      return Result.success(item.toEntity());
    } on Object catch (error) {
      return Result.failure(AppException.from(error));
    }
  }
}
