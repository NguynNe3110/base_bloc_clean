import 'dart:async';

typedef InitializerStep = FutureOr<void> Function();

class AppInitializer {
  const AppInitializer();

  Future<void> run(Iterable<InitializerStep> steps) async {
    for (final step in steps) {
      await step();
    }
  }
}
