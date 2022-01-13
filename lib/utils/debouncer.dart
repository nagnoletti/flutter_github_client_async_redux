import 'dart:async';

///
/// debouncer.dart
///

class Debouncer {
  final Duration _delay;
  void Function()? _callback;
  Timer? _timer;

  Debouncer({required int millis}) : _delay = Duration(milliseconds: millis);

  void debounce(void Function() callback) {
    _callback = callback;

    cancel();
    _timer = Timer(_delay, flush);
  }

  void cancel() {
    _timer?.cancel();
  }

  void flush() {
    cancel();
    _callback?.call();
  }
}
