import 'package:flutter/material.dart';
import 'package:zikirdua/dark_mode/dark_theme_pref.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePref darkThemePref = DarkThemePref();

  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePref.setDarkTheme(value);

    notifyListeners();
  }
}
