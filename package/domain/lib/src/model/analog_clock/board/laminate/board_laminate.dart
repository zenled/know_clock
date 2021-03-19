import 'package:common/common.dart';
import 'package:domain/src/model/analog_clock/board/laminate/colored_board_laminate.dart';

@immutable
abstract class BoardLaminate {
  T map<T>({
    required T Function(ColoredBoardLaminate) colored,
  }) {
    final laminate = this;
    if (laminate is ColoredBoardLaminate) {
      return colored(laminate);
    }
    throw Error();
  }
}
