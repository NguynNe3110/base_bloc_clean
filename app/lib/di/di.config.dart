// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:baseon/di/app_module.dart' as _i111;
import 'package:baseon/features/todo/bloc/todo_bloc.dart' as _i883;
import 'package:baseon/navigation/app_router.dart' as _i537;
import 'package:data/data.dart' as _i437;
import 'package:domain/domain.dart' as _i494;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i537.AppRouter>(() => appModule.appRouter());
    gh.lazySingleton<_i437.TodoDataSource>(() => appModule.todoDataSource());
    gh.lazySingleton<_i494.TodoRepository>(
      () => appModule.todoRepository(gh<_i437.TodoDataSource>()),
    );
    gh.factory<_i494.GetTodos>(
      () => appModule.getTodos(gh<_i494.TodoRepository>()),
    );
    gh.factory<_i494.AddTodo>(
      () => appModule.addTodo(gh<_i494.TodoRepository>()),
    );
    gh.factory<_i494.ToggleTodo>(
      () => appModule.toggleTodo(gh<_i494.TodoRepository>()),
    );
    gh.factory<_i883.TodoBloc>(
      () => appModule.todoBloc(
        gh<_i494.GetTodos>(),
        gh<_i494.AddTodo>(),
        gh<_i494.ToggleTodo>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i111.AppModule {}
