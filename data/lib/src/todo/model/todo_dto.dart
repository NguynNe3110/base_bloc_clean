import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_dto.freezed.dart';
part 'todo_dto.g.dart';

@freezed
abstract class TodoDto with _$TodoDto {
  const TodoDto._();

  const factory TodoDto({
    required String id,
    required String title,
    @Default(false) bool isCompleted,
  }) = _TodoDto;

  factory TodoDto.fromJson(Map<String, Object?> json) =>
      _$TodoDtoFromJson(json);

  Todo toEntity() => Todo(id: id, title: title, isCompleted: isCompleted);
}
