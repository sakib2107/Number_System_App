import 'package:flutter/material.dart';

class BinaryToHexProvider with ChangeNotifier {
  String _result = "";

  String get result => _result;

  void convertBinaryToHex(String binary) {
    try {
      // Convert binary → decimal → hex
      int decimal = int.parse(binary, radix: 2);
      _result = decimal.toRadixString(16).toUpperCase();
    } catch (e) {
      _result = "Invalid Binary Input";
    }
    notifyListeners();
  }

  void clear() {
    _result = "";
    notifyListeners();
  }
}