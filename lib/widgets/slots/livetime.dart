import 'package:flutter/material.dart';
import 'package:hybriidflow/global/globvabs.dart';
import 'package:intl/intl.dart';

import '../blurredcontainerwidget.dart';
import '../fullscreencentertext.dart';
import '../settings.dart';

class time extends StatefulWidget {
  const time({key}) : super(key: key);

  @override
  _timeState createState() => _timeState();
}

class _timeState extends State<time> {


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
    if (timeseconds == true)
      setState(() {
        timeseconds = false;
        sn = 'Off';
      });
    else
      setState(() {
        timeseconds = true;
        sn = 'On';
      });
  }


  DateTime now = DateTime.now();
  void gettime() {
    setState(() {
      now = DateTime.now();
    });


    Future.delayed(Duration(seconds: 1), () {
      gettime();
    });
  }

  void initState() {
    super.initState();
    gettime();
    // ignore: undefined_prefixed_name

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: fstext(
            text: timeseconds == true ? '${DateFormat('h').format(now)}:${DateFormat('ms').format(now)}'   : '${DateFormat('h').format(now)}:${DateFormat('m').format(now)}',
            text2: ('${DateFormat('a').format(now)}') ,
            color: Color(0xffc7c7c7),
            color2: Color(0xffc7c7c7),
          ),
        ),
        Visibility(
            visible: visibilesetting,child: Center(child: BContainer(child: Center(
          child: Wrap(
            children: [
              SizedBox(
                height: 30,
              ),
              option(stext: sn, s: second, textsize: 20, ogtextl: 'Show Seconds',),
            ],
          ),
        ) ,))),


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            MouseRegion(
              onHover: anim,
              onExit: falseanim,
              child: InkWell(
                onTap: vssetting,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: issolid == true ? 0 : 300),
                  width: cc == true ? 35 : 48,
                  height: 35,
                  curve: Curves.easeInOutBack,
                  child:
                  Icon(Icons.settings, color: Color(0xff505050)),
                  decoration: BoxDecoration(
                      color:
                      cc == true ? Color(0xd3afafaf) : Color(0xffc4c4c4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: -12.0,
                          blurRadius: 12.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30)),
                ),

              ),
            ),

          ],
        ),
      ],
    );
  }
}
