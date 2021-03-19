import 'package:domain/src/model/analog_clock/board/laminate/colored_board_laminate.dart';
import 'package:domain/src/model/component/component_color.dart';
import 'package:test/test.dart';

void main() {
  test('calling. toString produces a readable output', () {
    final laminate = ColoredBoardLaminate(color: ComponentColor(0xFFFFFF));
    expect(laminate.toString(), 'ColoredBoardLaminate{...}');
  });

  test('has ==', (){
    final l1 = ColoredBoardLaminate(color: ComponentColor(0xFFFFFF));
    final l2 = ColoredBoardLaminate(color: ComponentColor(0xFFFFFF));
    expect(l1, l2);
  });
}
