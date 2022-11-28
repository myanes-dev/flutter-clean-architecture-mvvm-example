import 'package:flutter/material.dart';

class TestUtils {
  static Widget createWidgetForTesting({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }
}
