import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  int counter = 0;

  void Increment() {
    counter++;
    notifyListeners();
  }
}
