

import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void addCounter() {
    _counter++;
    notifyListeners();
  }
}