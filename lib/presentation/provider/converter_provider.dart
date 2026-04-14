import 'package:flutter/material.dart';

class NumberSystemProvider with ChangeNotifier {
  String _result = "";

  String get result => _result;

  void binaryToHex(String binary) {
    try {
      int decimal = int.parse(binary, radix: 2);
      _result = decimal.toRadixString(16).toUpperCase();
    } catch (e) {
      _result = "Invalid Binary Input";
    }
    notifyListeners();
  }

  void hexToBinary(String hex) {
    try {
      int decimal = int.parse(hex, radix: 16);
      _result = decimal.toRadixString(2);
    } catch (e) {
      _result = "Invalid Hex Input";
    }
    notifyListeners();
  }

  void binaryToOctal(String binary) {
    try {
      int decimal = int.parse(binary, radix: 2);
      _result = decimal.toRadixString(8);
    } catch (e) {
      _result = "Invalid Binary Input";
    }
    notifyListeners();
  }

  void octalToBinary(String octal) {
    try {
      int decimal = int.parse(octal, radix: 8);
      _result = decimal.toRadixString(2);
    } catch (e) {
      _result = "Invalid Octal Input";
    }
    notifyListeners();
  }

  void decimalToOctal(String decimalInput) {
    try {
      int decimal = int.parse(decimalInput);
      _result = decimal.toRadixString(8);
    } catch (e) {
      _result = "Invalid Decimal Input";
    }
    notifyListeners();
  }

  void octalToDecimal(String octal) {
    try {
      int decimal = int.parse(octal, radix: 8);
      _result = decimal.toString();
    } catch (e) {
      _result = "Invalid Octal Input";
    }
    notifyListeners();
  }

  void clear() {
    _result = "";
    notifyListeners();
  }
}