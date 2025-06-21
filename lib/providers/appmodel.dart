import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {

  AppModel() {
    gettime();
  }

  DateTime now = DateTime.now();
  Color widgetcolor = Color(0x7a555555);

  void gettime() {
    now = DateTime.now();

    Future.delayed(Duration(seconds:1), () {
      gettime();
      notifyListeners();

    });
  }

  void updateColor(Color color){
    widgetcolor = color;
    notifyListeners();
    print("updatecolorcalled");
  }


}
