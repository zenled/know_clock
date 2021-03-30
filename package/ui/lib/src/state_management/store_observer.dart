import 'package:common/common.dart';
import 'package:flutter/material.dart';

typedef StoreObserverBuilder<T> = Widget Function(BuildContext context, T ui);

class StoreObserver<T> extends StatelessWidget {
  StoreObserver({
    required this.ui,
    required this.builder,
  });

  final ValueStream<T> ui;

  final StoreObserverBuilder<T> builder;

  T _getInitialData() {
    final valueWrapper = ui.valueWrapper;
    if (valueWrapper == null) {
      throw StateError('The provided stream has not yet emitted a value');
    }
    return valueWrapper.value;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      initialData: _getInitialData(),
      stream: ui,
      builder: (context, snapshot) {
        return builder(context, snapshot.requireData);
      },
    );
  }
}
