import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vibrate/vibrate.dart';

class Scan with ChangeNotifier {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  get keys => _globalKey;
  Map<String, bool> _list = {};

  Map<String, bool> getList() => _list;

  get clearList => _list.clear();

  setList(String barcodes) {
    List<dynamic> dummy = [];
    List a = barcodes.split("\n");
    for (String i in a) {
      if (i != "") {
        var re = i.toString().split(",");
        dummy.addAll(re);
      }
    }
    Map<String, bool> map = {};
    for (var i in dummy) {
      map[i] = false;
    }
    _list = map;
  }

  tog(String barcode) {
    _list[barcode] = !_list[barcode];
    notifyListeners();
  }

  toggle(String barcode) {
    List list = _list.keys.toList();
    if (list.contains(barcode)) {
      Vibrate.canVibrate.then((bool vb) {
        if (vb) {
          Vibrate.vibrate();

        }
      });

      _list[barcode] = true;
      _globalKey.currentState.showSnackBar(SnackBar(
        content: Text("$barcode를 찾았습니다."),
        duration: Duration(milliseconds: 200),
      ));

      notifyListeners();
    }
  }
}
