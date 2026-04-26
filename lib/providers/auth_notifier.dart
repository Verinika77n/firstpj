import 'package:flutter/material.dart';

class AuthNotifier extends ChangeNotifier {
  bool _isAuthorized = false;

  bool get isAuthorized => _isAuthorized;

  void login() {
    _isAuthorized = true;
    notifyListeners();
  }

  void logout() {
    _isAuthorized = false;
    notifyListeners();
  }
}
