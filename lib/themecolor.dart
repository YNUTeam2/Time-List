import 'package:flutter/material.dart';
import 'package:time_list/test.dart';

class ThemeColorModel extends ChangeNotifier {
  Color _themeColor = Colors.blue;
  Color _clockColor = Colors.blue;

  Color get themeColor => _themeColor;
  Color get clockColor => _clockColor;

  void changeThemeColor(Color color) {
    _themeColor = color;
    notifyListeners();
  }

  void changeClockColor(Color color) {
    _clockColor = color;
    notifyListeners();
  }
}
