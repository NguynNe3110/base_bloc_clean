import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

import 'core/theme/app_theme.dart';
import 'navigation/app_router.dart';

class App extends StatelessWidget {
  const App({required this.router, super.key});

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: router.config(),
    );
  }
}
