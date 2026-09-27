import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

/// Records optional usage events without delaying or failing user actions.
class AppAnalytics {
  const AppAnalytics._();

  static void log(String name, {Map<String, Object>? parameters}) {
    unawaited(_log(name, parameters));
  }

  static Future<void> _log(String name, Map<String, Object>? parameters) async {
    try {
      await FirebaseAnalytics.instance.logEvent(
        name: name,
        parameters: parameters,
      );
    } catch (error) {
      debugPrint('Could not log analytics event $name: $error');
    }
  }
}
