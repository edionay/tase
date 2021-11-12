import 'package:flutter/material.dart';

class ResponsiveProvider extends ChangeNotifier {
  bool _tableView = true;

  bool get tableView => _tableView;

  set tableView(bool isMobile) {
    _tableView = isMobile;
    notifyListeners();
  }
}
