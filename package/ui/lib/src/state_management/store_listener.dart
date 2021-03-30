import 'package:flutter/material.dart';

mixin StoreListener on State {
  late bool _isBuilding;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _onBuildStarted();
  }

  @override
  void didUpdateWidget(covariant StatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _onBuildStarted();
  }

  /// Executes [callback] if this [State] is mounted.
  void ifMounted(void Function() callback) {
    if (mounted) {
      callback();
    }
  }

  /// Executes [callback] in a way that does not conflict with Flutter.
  ///
  /// The [callback] is called only if this [State] is mounted.
  /// If this [State] is in the build process, it waits until the end of the
  /// frame to execute the [callback] (prevents errors such as:
  /// setState() or markNeedsBuild called during build).
  void doSafely(void Function() callback) => ifMounted(() {
        if (!_isBuilding) {
          callback();
        }

        WidgetsBinding.instance!.addPostFrameCallback((_) => ifMounted(() {
              callback();
            }));
      });

  void _onBuildStarted() {
    _isBuilding = true;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _isBuilding = false;
    });
  }
}
