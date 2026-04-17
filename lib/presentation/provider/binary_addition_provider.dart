import 'package:flutter/material.dart';

class BinaryStateProvider extends ChangeNotifier {
  String first = "";
  String second = "";
  String result = "";

  bool isBinary(String input) {
    return RegExp(r'^[01]+$').hasMatch(input);
  }

  void setFirst(String value) {
    first = value;
  }

  void setSecond(String value) {
    second = value;
  }

  void calculate() {
    if (!isBinary(first) || !isBinary(second)) {
      result = "Invalid input";
    } else {
      int a = int.parse(first, radix: 2);
      int b = int.parse(second, radix: 2);
      result = (a + b).toRadixString(2);
    }
    notifyListeners();
  }

  void reset() {
    first = "";
    second = "";
    result = "";
    notifyListeners();
  }
}