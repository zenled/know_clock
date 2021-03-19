import 'package:domain/src/model/component/component_color.dart';
import 'package:test/test.dart';

void main() {
  test('has readable .toString', () {
    final color = ComponentColor(0xFF1122);
    expect(color.toString(), 'ComponentColor{0xFF1122}');
  });

  test('throws error when instantiated with an invalid color', () {
    expect(() => ComponentColor(-1), throwsArgumentError);
    expect(() => ComponentColor(0xFFFFFF + 1), throwsArgumentError);
  });
}
