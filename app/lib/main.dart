import 'package:flutter/material.dart';
import 'package:initializer/initializer.dart';

import 'app.dart';
import 'di/di.dart';
import 'navigation/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await const AppInitializer().run([configureDependencies]);

  runApp(App(router: getIt<AppRouter>()));
}
