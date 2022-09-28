import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/enum/load_status.dart';

class BProvider with ChangeNotifier {
  LoadStatus loadStatus = LoadStatus.initial;

  int _a = 0;

  int get count => _a;
  void increment() {
    _a += 1;
    print('aaa from B page : .... ${_a}');
    notifyListeners();
  }
}
