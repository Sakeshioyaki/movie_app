import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/enum/load_status.dart';

class AProvider with ChangeNotifier {
  LoadStatus loadStatus = LoadStatus.initial;

  int a = 0;
  void increment() {
    a += 1;
    print('aaa from A page : .... ${a}');
    notifyListeners();
  }
}
