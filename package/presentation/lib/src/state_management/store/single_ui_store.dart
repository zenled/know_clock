import 'package:common/common.dart';
import 'package:presentation/src/state_management/store/store.dart';

abstract class SingleUiStore<T> extends Store {
  final _uiSubject = BehaviorSubject<T>();

  @override
  void disposeStore() {
    _uiSubject.close();
    super.disposeStore();
  }

  set ui(T value) {
    ifOperational(() {
      _uiSubject.add(value);
    });
  }

  ValueStream<T> get outUi => _uiSubject;
}
