import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ThemeProvider with ChangeNotifier {
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme; //getter

  //setter
  set darkTheme(bool value) {
    _darkTheme = value;
    notifyListeners();
  }
}
