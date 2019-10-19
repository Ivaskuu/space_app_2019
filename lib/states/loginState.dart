import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginState with ChangeNotifier {
  TextEditingController _usernameController = new TextEditingController();
  bool showPassword = false;

  void modShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  TextEditingController get username => _usernameController;
}
