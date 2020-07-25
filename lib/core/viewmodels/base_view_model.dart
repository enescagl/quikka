import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  set busy(value) {
    _busy = value;
    notifyListeners();
  }
}
