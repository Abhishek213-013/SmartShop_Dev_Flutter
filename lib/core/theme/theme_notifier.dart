import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  static const String prefKey = 'isDarkTheme';

  late ThemeData _currentTheme;
  ThemeData get currentTheme => _currentTheme;

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  ThemeNotifier() {
    _loadFromPrefs();
  }

  toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    _currentTheme = _isDarkTheme ? darkTheme : lightTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool(prefKey) ?? false;
    _currentTheme = _isDarkTheme ? darkTheme : lightTheme;
    notifyListeners();
  }

  _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(prefKey, _isDarkTheme);
  }
}
