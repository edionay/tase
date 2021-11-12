import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  String _inputFilter = "";
  bool _isAscending = true;
  bool get isAscending => _isAscending;

  String get inputFilter => _inputFilter;

  set input(String input) {
    _inputFilter = input;
    notifyListeners();
  }

  set isAscending(bool ascending) {
    _isAscending = ascending;
    notifyListeners();
  }

  void toggleSorting() {
    _isAscending = !_isAscending;
    notifyListeners();
  }

}
