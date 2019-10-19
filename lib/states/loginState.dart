import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:space_app_2019/pages/home/home_page.dart';

class LoginState with ChangeNotifier {
  TextEditingController _usernameController = new TextEditingController();
  bool showPassword = false;

  void modShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void login(BuildContext context) {
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  TextEditingController get username => _usernameController;
}
