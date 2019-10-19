import 'package:flutter/foundation.dart';

class NavigationState with ChangeNotifier {
  int _index = 0;

  void changepage(int index) {
    _index = index;
    notifyListeners();
  }

  int get index => _index;
}
