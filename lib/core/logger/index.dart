import 'dart:developer';

import 'package:flutter/foundation.dart';

class Logger {
  static debug(String title, [dynamic message]) {
    if (kDebugMode) {
      if (message != null) {
        log("$title -> $message");
      } else {
        log(title);
      }
    }
  }

  static error(Object error) {
    log(error.toString());
  }
}
