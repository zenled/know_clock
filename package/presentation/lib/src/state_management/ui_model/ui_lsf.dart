import 'package:common/common.dart';

@immutable
class UiLsf<S, F> {
  UiLsf.loading() : state = _State.loading;

  UiLsf.success(S value)
      : state = _State.success,
        success = value;

  UiLsf.failure(F value)
      : state = _State.failure,
        failure = value;

  final _State state;

  late final S success;
  late final F failure;

  bool get isLoading => state == _State.loading;
  bool get isSuccess => state == _State.success;
  bool get isFailure => state == _State.failure;

  T when<T>({
    required T Function() loading,
    required T Function(S) success,
    required T Function(F) failure,
  }) {
    switch (state) {
      case _State.loading:
        return loading();
      case _State.success:
        return success(this.success);
      case _State.failure:
        return failure(this.failure);
    }
  }
}

enum _State {
  loading,
  success,
  failure,
}
