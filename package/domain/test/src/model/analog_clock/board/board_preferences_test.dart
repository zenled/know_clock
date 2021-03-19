import 'package:domain/domain.dart';
import 'package:domain/src/model/analog_clock/board/board_preferences.dart';
import 'package:test/test.dart';

void main() {
  test('has readable .toString', () {
    final boardFactory = _BoardPreferencesFactory()..isVisible = true;
    final board = boardFactory.build();
    expect(board.toString(), 'BoardPreferences{isVisible: true, ...}');
  });
}

class _BoardPreferencesFactory {
  bool isVisible = true;
  BoardShape shape = CircleBoardShape();
  BoardLaminate laminate =
      ColoredBoardLaminate(color: ComponentColor(0xFFFFFF));

  BoardPreferences build() {
    return BoardPreferences(
      isVisible: isVisible,
      shape: shape,
      laminate: laminate,
    );
  }
}
