import 'package:domain/domain.dart';
import 'package:shared/shared.dart';
import 'package:test/test.dart';

void main() {
  test('AddTodo trims and sends a valid title to repository', () async {
    final repository = _FakeTodoRepository();
    final result = await AddTodo(repository)('  Học BLoC  ');
    expect(result.dataOrNull?.title, 'Học BLoC');
    expect(repository.lastTitle, 'Học BLoC');
  });

  test('AddTodo returns failure for an empty title', () async {
    final result = await AddTodo(_FakeTodoRepository())('   ');
    expect(result, isA<Failure<Todo>>());
  });
}

class _FakeTodoRepository implements TodoRepository {
  String? lastTitle;

  @override
  Future<Result<Todo>> addTodo(String title) async {
    lastTitle = title;
    return Result.success(Todo(id: '1', title: title));
  }

  @override
  Future<Result<List<Todo>>> getTodos() async => const Result.success([]);

  @override
  Future<Result<Todo>> toggleTodo(String id) async =>
      throw UnimplementedError();
}
