import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';

import 'package:hybriidflow/global/globvabs.dart';
import 'package:hybriidflow/widgets/blurredcontainerwidget.dart';

import '../settings.dart';

class Analog extends StatefulWidget {
  @override
  _AnalogState createState() => _AnalogState();
}

class _AnalogState extends State<Analog> {
  bool cc = true;
  bool visibilesetting = false;
  String sn = 'On';

  void anim(PointerEvent details) {
    setState(() {
      cc = false;
    });
  }

  void falseanim(PointerEvent details) {
    setState(() {
      cc = true;
    });
  }

  void vssetting(){
    if (visibilesetting == true)
      setState(() {
        visibilesetting = false;
      });
    else
      setState(() {
        visibilesetting = true;
      });
  }

  void second(){
    if (showseconds == true)
      setState(() {
        showseconds = false;
        sn = 'Off';
      });
    else
      setState(() {
        showseconds = true;
        sn = 'On';
      });
  }
  String tn = 'On';
  void tick(){
    if (showticks == true)
      setState(() {
        showticks = false;
        tn = 'Off';
      });
    else
      setState(() {
        showticks = true;
        tn = 'On';
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnalogClock(

                decoration: BoxDecoration(
                  color: Color(0xda191919),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: <Color>[Colors.white60,
                      Color(0xDCFFFFFF)],
                  ),
                ),




                hourHandColor: Colors.black,
                minuteHandColor: Colors.black,
                tickColor: Colors.black,
                secondHandColor: Colors.white,
                numberColor: Colors.black,
                showDigitalClock: false
                ,





              ),
            ),
          ),
        ),




      ],
    );
  }
}