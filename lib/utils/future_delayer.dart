import 'dart:io';

abstract class FutureDelayer {
  static Future delayBy1000() => Future.delayed(const Duration(milliseconds: 1000));
  static Future delayBy1500() => Future.delayed(const Duration(milliseconds: 1500));
  static Future delayBy2000() => Future.delayed(const Duration(milliseconds: 2000));
}

extension WithDelay<T> on T {
  Future<T> toWait([Duration? delay]) => delay != null ? Future<T>.delayed(delay, () => this) : Future.value(this);
}
