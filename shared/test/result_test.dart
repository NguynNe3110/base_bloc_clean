import 'package:shared/shared.dart';
import 'package:test/test.dart';

void main() {
  test('Result exposes success data', () {
    const result = Result<int>.success(42);
    expect(result.dataOrNull, 42);
  });
}
