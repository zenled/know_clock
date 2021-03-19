import 'package:domain/src/model/component/component_color.dart';
import 'package:test/test.dart';

void main() {
  test('has ==', (){
    final c1 = ComponentColor(0xFF1122);
    final c2 = ComponentColor(0xFF1122);
    expect(c1, c2);
  });

  test('calling .toString produces a readable output', () {
    final color = ComponentColor(0xFF1122);
    expect(color.toString(), 'ComponentColor{0xFF1122}');
  });

  test('throws if invalid color', () {
    expect(() => ComponentColor(-1), throwsArgumentError);
    expect(() => ComponentColor(0xFFFFFF + 1), throwsArgumentError);
  });
}
