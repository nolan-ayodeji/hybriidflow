import 'package:flutter/material.dart';
import 'package:hybriidflow/global/globvabs.dart';
import 'fullscreencentertext.dart';
import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
bool opened = false;

class warning1 extends StatefulWidget {
  final visible1;
  final visible2;


  const warning1({Key? key, this.visible1, this.visible2}) : super(key: key);@override
  _warning1State createState() => _warning1State();
}

class _warning1State extends State<warning1> {
  var battery = Battery();
  int percentage = 0;

  String welcome = opened == true ? "No Widgets" : "Welcome to HybriidFlow";


  @override
  void initState() {
    super.initState();

    // calling the method to display battery percentage
    getBatteryPerentage();

  }

  // method created to display battery percent
  void getBatteryPerentage() async {
    final level = await battery.batteryLevel;
    percentage = level;

    setState(() {});
  }


  @override

  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible1,
      child: Visibility(
        visible: widget.visible2,
        child: fstext(
          text: opened == true ? "No Widgets" : "Welcome to HybriidFlow",
          textsize:20,
          textsize2: 13,

          text2: 'Press the + button to add a widget! • Flow $hflowversion',
          color: Color(0xaee4eaef),
          color2: Color(0xb0dbe3ec),
        ),
      ),
    );
  }
}
