import 'package:common/common.dart';
import 'package:presentation/src/state_management/store/store.dart';

mixin SingleOutStateStore<T> on Store {
  final _stateUiSubject = BehaviorSubject<T>();

  @override
  void disposeStore() {
    _stateUiSubject.close();
    super.disposeStore();
  }

  set stateUi(T value) {
    if (isMounted) {
      _stateUiSubject.add(value);
    }
  }

  ValueStream<T> get outState => _stateUiSubject;
}
