import 'dart:io';

abstract class FutureDelayer {
  static delayBy1000() => Future.delayed(const Duration(milliseconds: 1000));
  static delayBy1500() => Future.delayed(const Duration(milliseconds: 1500));
  static delayBy2000() => Future.delayed(const Duration(milliseconds: 2000));
  final asdd = Duration();

}

extension WithDelay<T> on T {
  Future<T> toWait([Duration? delay]) => delay != null ? Future<T>.delayed(delay, () => this) : Future.value(this);
}
