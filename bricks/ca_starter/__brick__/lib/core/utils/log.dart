import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  static late Logger _logPrint;

  static void init() => _logPrint = Logger();

  /// Print for trace
  static void t(String message) {
    if (kDebugMode) {
      return _logPrint.t(message);
    }
  }

  /// Print for Debug
  static void d(String message) {
    if (kDebugMode) {
      return _logPrint.d(message);
    }
  }

  /// Print for Info
  static void i(String message) {
    if (kDebugMode) {
      return _logPrint.i(message);
    }
  }

  /// Print for Error
  static void e(String? message, {StackTrace? stackTrace}) {
    if (kDebugMode) {
      return _logPrint.e(message, stackTrace: stackTrace);
    }
  }

  /// Print for Fatal
  static void f(String? message, {StackTrace? stackTrace}) {
    if (kDebugMode) {
      return _logPrint.f(message, stackTrace: stackTrace);
    }
  }
}
