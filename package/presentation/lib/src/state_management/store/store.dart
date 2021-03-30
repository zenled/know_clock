import 'package:common/common.dart';

abstract class Store {
  var _lifecycle = _Lifecycle.created;

  @protected
  @visibleForTesting
  bool get isOperational => _lifecycle == _Lifecycle.operational;

  @protected
  @mustCallSuper
  @visibleForTesting
  void initStore() {
    if (_lifecycle == _Lifecycle.operational) {
      throw StateError('Store has already been initialized');
    }
    if (_lifecycle == _Lifecycle.disposed) {
      throw StateError('Cannot initialize Store after it is disposed');
    }
    _lifecycle = _Lifecycle.operational;
  }

  @protected
  @mustCallSuper
  @visibleForTesting
  void disposeStore() {
    if (_lifecycle == _Lifecycle.created) {
      throw StateError('Store was disposed, but never initialized');
    }
    if (_lifecycle == _Lifecycle.disposed) {
      throw StateError('Store has already been disposed');
    }
    _lifecycle = _Lifecycle.disposed;
  }

  @protected
  @visibleForTesting
  void ifOperational(void Function() callback) {
    if (isOperational) {
      callback();
    }
  }
}

enum _Lifecycle {
  created,
  operational,
  disposed,
}
