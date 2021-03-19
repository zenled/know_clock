import 'package:domain/src/model/analog_clock/board/laminate/colored_board_laminate.dart';
import 'package:domain/src/model/component/component_color.dart';
import 'package:test/test.dart';

void main() {
  test('has readable .toString', () {
    final laminate = ColoredBoardLaminate(color: ComponentColor(0xFFFFFF));
    expect(laminate.toString(), 'ColoredBoardLaminate{...}');
  });
}
