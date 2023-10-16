import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  static late Logger _logPrint;

  static void init() => _logPrint = Logger();

  /// Comment for trace
  static void t(String message) {
    if (kDebugMode) {
      return _logPrint.t(message);
    }
  }

  /// Comment for Debug
  static void d(String message) {
    if (kDebugMode) {
      return _logPrint.d(message);
    }
  }

  /// Comment for Info
  static void i(String message) {
    if (kDebugMode) {
      return _logPrint.i(message);
    }
  }

  /// Comment for Error
  static void e(String message) {
    if (kDebugMode) {
      return _logPrint.e(message);
    }
  }
}
