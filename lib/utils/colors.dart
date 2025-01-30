
import 'package:flutter/material.dart';

class AppStyle {
  // Singleton using factory constructor
  static final AppStyle _instance = AppStyle._internal();

  AppStyle._internal();

  factory AppStyle() {
    return _instance;
  }

  // Define colors
  final MaterialColor primaryColor = Colors.blue; // Example color
  static const Color black = Colors.black;
  static const Color white = Colors.white;
}
