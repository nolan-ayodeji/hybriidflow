import 'package:flutter/material.dart';
import 'package:hybriidflow/global/globvabs.dart';
import 'package:intl/intl.dart';

import '../blurredcontainerwidget.dart';
import '../fullscreencentertext.dart';
import '../settings.dart';
import 'dart:async';
import 'package:battery_plus/battery_plus.dart';

class bat extends StatefulWidget {
  const bat({key}) : super(key: key);

  @override
  _batState createState() => _batState();
}

class _batState extends State<bat> {
  var battery = Battery();
  int percentage = 0;




  // method created to display battery percent
  void getBatteryPerentage() async {
    print('GOT BATTERY and it is $percentage');
    final level = await battery.batteryLevel;
    percentage = level;

    setState(() {});
    Future.delayed(Duration(seconds: 5), () {
      getBatteryPerentage();
      print('GOT BATTERY and it is $percentage');
    });
  }

  @override
  void initState() {
    super.initState();

    // calling the method to display battery percentage
    getBatteryPerentage();

  }
  @override



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: fstext(
            text: '$percentage%',
            text2: percentage < 20 ? "Battery Low" : "Battery" ,
            color: percentage > 20 ? Colors.greenAccent : Colors.redAccent,
            color2: Color(0xffc7c7c7),
            textsize: 90,
          ),
        ),




      ],
    );
  }
}
