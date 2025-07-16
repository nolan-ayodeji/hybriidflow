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



class FMModel extends ChangeNotifier {

  FMModel() {

  }

  void setView(String set){
    view = set;
    notifyListeners();
    print("provcalled");
  }

  String view = "modern";



}

class QRModel extends ChangeNotifier {

  QRModel() {

  }

  void rebuild(){
    print("rebuilding");

    notifyListeners();
  }

  String view = "modern";



}