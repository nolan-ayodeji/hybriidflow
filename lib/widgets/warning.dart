import 'package:flutter/material.dart';
import 'package:hybriidflow/global/globvabs.dart';
import 'fullscreencentertext.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../firebase_options.dart';


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
  String messagetoshow = "Error";

  FirebaseFirestore firestore = FirebaseFirestore.instance;


  String welcome = opened == true ? "No Widgets" : "Welcome to HybriidFlow";


  @override
  void initState()  {
    super.initState();

    loadFirestoreData();

    // calling the method to display battery percentage
    getBatteryPerentage();



  }

  void loadFirestoreData() async {
    var snapshot = await firestore.collection('Info').doc('updates').get();

    String? message = snapshot.data()?['Work'];
    messagetoshow = snapshot.data()?['Work'];

    print("Firestore data: ${message}");
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
          text: opened == true ? "No Widgets" : messagetoshow,
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
