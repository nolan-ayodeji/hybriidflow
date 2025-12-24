import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {

  AppModel() {
    gettime();
  }

  DateTime now = DateTime.now();
  Color widgetcolor = Color(0x7a555555);
  double size = 0;
  bool logVis = true;

  void gettime() {
    now = DateTime.now();

    Future.delayed(Duration(seconds:1), () {
      gettime();
      notifyListeners();

    });
  }

  void setlog(){
    if (logVis == true){
      logVis = false;
    } else {
      logVis = true;
    }

    notifyListeners();


  }

  void updateColor(Color color){
    widgetcolor = color;
    notifyListeners();
    //blank print("updatecolorcalled");
  }


}



class FMModel extends ChangeNotifier {

  FMModel() {

  }

  void setView(String set){
    view = set;
    notifyListeners();
    //blank print("provcalled");
  }

  String view = "modern";



}

class QRModel extends ChangeNotifier {

  QRModel() {

  }

  void rebuild(){
    //blank print("rebuilding");

    notifyListeners();
  }

  String view = "modern";



}

class LogInModel extends ChangeNotifier {



  LogInModel() {

  }

  bool isError = false;

  void temp(){
    //blank print("rebuilding");

    isError = true;
    Future.delayed(const Duration(seconds: 5), () {
      isError = false;
    });
    notifyListeners();
  }

  String view = "modern";



}
