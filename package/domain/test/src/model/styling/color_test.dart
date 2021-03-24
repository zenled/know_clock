import 'package:domain/domain.dart';
import 'package:test/test.dart';

void main() {
  test('has readable .toString', () {
    final color = Color(0xFF1122);
    expect(color.toString(), 'ComponentColor{0xFF1122}');
  });

  test('throws error when instantiated with an invalid value', () {
    expect(() => Color(-1), throwsArgumentError);
    expect(() => Color(0xFFFFFF + 1), throwsArgumentError);
  });
}
