import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_state.freezed.dart';

enum TodoStatus { initial, loading, success, failure }

@freezed
abstract class TodoState with _$TodoState {
  const factory TodoState({
    @Default(TodoStatus.initial) TodoStatus status,
    @Default([]) List<Todo> todos,
    String? errorMessage,
  }) = _TodoState;
}
