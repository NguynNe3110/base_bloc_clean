import 'package:auto_route/auto_route.dart';

import '../features/todo/view/todo_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: TodoRoute.page, initial: true),
  ];
}
