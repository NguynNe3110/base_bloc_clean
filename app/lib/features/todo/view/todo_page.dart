import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resources/resources.dart';

import '../../../di/di.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';

@RoutePage()
class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TodoBloc>()..add(const TodoStarted()),
      child: const _TodoView(),
    );
  }
}

class _TodoView extends StatefulWidget {
  const _TodoView();

  @override
  State<_TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<_TodoView> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addTodo() {
    context.read<TodoBloc>().add(TodoAdded(_controller.text));
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.todoTitle)),
      body: BlocConsumer<TodoBloc, TodoState>(
        listenWhen: (previous, current) =>
            previous.errorMessage != current.errorMessage &&
            current.errorMessage != null,
        listener: (context, state) => ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(state.errorMessage!))),
        builder: (context, state) {
          if (state.status == TodoStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == TodoStatus.failure && state.todos.isEmpty) {
            return Center(
              child: FilledButton(
                onPressed: () =>
                    context.read<TodoBloc>().add(const TodoStarted()),
                child: const Text(AppStrings.retry),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.todos.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final todo = state.todos[index];
              return CheckboxListTile(
                value: todo.isCompleted,
                title: Text(todo.title),
                onChanged: (_) =>
                    context.read<TodoBloc>().add(TodoToggled(todo.id)),
              );
            },
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: AppStrings.newTodo,
                ),
                onSubmitted: (_) => _addTodo(),
              ),
            ),
            const SizedBox(width: 12),
            IconButton.filled(
              onPressed: _addTodo,
              icon: const Icon(Icons.add),
              tooltip: AppStrings.add,
            ),
          ],
        ),
      ),
    );
  }
}
