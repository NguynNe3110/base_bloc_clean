import '../model/todo_dto.dart';
import 'todo_data_source.dart';

class InMemoryTodoDataSource implements TodoDataSource {
  final List<TodoDto> _items = [
    const TodoDto(
      id: '1',
      title: 'Đọc README để hiểu kiến trúc',
      isCompleted: false,
    ),
  ];

  @override
  Future<List<TodoDto>> getTodos() async => List.unmodifiable(_items);

  @override
  Future<TodoDto> addTodo(String title) async {
    final todo = TodoDto(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title,
      isCompleted: false,
    );
    _items.add(todo);
    return todo;
  }

  @override
  Future<TodoDto> toggleTodo(String id) async {
    final index = _items.indexWhere((item) => item.id == id);
    if (index == -1) {
      throw StateError('Không tìm thấy todo có id $id.');
    }

    final updated = _items[index].copyWith(
      isCompleted: !_items[index].isCompleted,
    );
    _items[index] = updated;
    return updated;
  }
}
