sealed class TodoEvent {
  const TodoEvent();
}

final class TodoStarted extends TodoEvent {
  const TodoStarted();
}

final class TodoAdded extends TodoEvent {
  const TodoAdded(this.title);

  final String title;
}

final class TodoToggled extends TodoEvent {
  const TodoToggled(this.id);

  final String id;
}
