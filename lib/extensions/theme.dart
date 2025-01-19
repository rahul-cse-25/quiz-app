import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  bool get isDarkMode => theme.brightness == Brightness.dark;

  void toggleTheme() {
    read<ThemeProvider>().toggleTheme(!isDarkMode);
  }

// color scheme with light and dark mode
  get backgroundColor => isDarkMode ? Color(0xff343a40) : Color(0xfffdfdf3);

  get extraContrast => isDarkMode ? Color(0xff212529) : Color(0xfff5f5f5);

  get extraBgColor => isDarkMode ? Color(0xff343a40) : Color(0xffeeecff);

  get textColor => isDarkMode ? Colors.white : Colors.black;
}
