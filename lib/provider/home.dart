import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  bool isMenuOpen = false;

  void toggleMenu(bool val) {
    isMenuOpen = val;
    notifyListeners();
  }
}
