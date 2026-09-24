import 'package:data/data.dart';
import 'package:test/test.dart';

void main() {
  test('repository maps data objects to domain entities', () async {
    final repository = TodoRepositoryImpl(InMemoryTodoDataSource());

    final created = await repository.addTodo('Viết test');
    final toggled = await repository.toggleTodo(created.dataOrNull!.id);
    final items = await repository.getTodos();

    expect(toggled.dataOrNull?.isCompleted, isTrue);
    expect(items.dataOrNull?.any((item) => item.title == 'Viết test'), isTrue);
  });
}
