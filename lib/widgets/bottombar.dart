import 'package:flutter/material.dart';
import 'package:hybriidflow/global/globvabs.dart';
import 'package:hybriidflow/pages/main.dart';
import 'package:hybriidflow/pages/time.dart';
import 'package:hybriidflow/pages/unknown.dart';
import 'package:page_transition/page_transition.dart';

class bottombar extends StatefulWidget {
  final ftext;
  final action;
  final saction;

  const bottombar({key, this.ftext, this.action, this.saction})
      : super(key: key);
  @override
  _bottombarState createState() => _bottombarState();
}

class _bottombarState extends State<bottombar> {
  Color top = Colors.grey.withOpacity(1);
  Color top2 = Colors.grey.withOpacity(0.5);
  bool cc = true;

  bool cc2 = true;

  void white(PointerEvent details) {
    setState(() {
      top = Colors.grey.withOpacity(1);
    });
  }

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

  void white2(PointerEvent details) {
    setState(() {
      cc2 = false;
    });
  }

  void blue2(PointerEvent details) {
    setState(() {
      cc2 = true;
    });
  }

  void blue(PointerEvent details) {
    setState(() {
      top = Color(0xffdeffc4);
    });
  }

  void decidemusic(){
    if (shouldshowmusic == true)
      setState(() {
        shouldshowmusic = false;
        //blank print('made false');
      });
    else setState(() {
      shouldshowmusic = true;
      //blank print('made true');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: anim,
      onExit: falseanim,
      child: Stack(
        children: [
          Column(
            children: [
              RepaintBoundary(
                child: Transform.scale(
                  scale: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MouseRegion(
                        onHover: white2,
                        onExit: blue2,
                        child: InkWell(
                          child: AnimatedContainer(
                            width: MediaQuery.of(context).size.width > 800
                                ? isanythingopen == true
                                ? cc2 == true
                                ? /* if something open, what will it be smaller */ 50
                                : /* if something open, what will it be bigger */ 65
                                : /* if media more than 800 */ 100
                                : isanythingopen == true
                                ? cc2 == true
                                ? /* if something open, what will it be smaller */ 50
                                : /* if something open, what will it be bigger */ 65
                                : /* if media less than 800 */ 50,
                            height: isanythingopen == true
                                ? 49
                                : cc2 == true
                                    ? 49
                                    : 70,
                            curve: Curves.easeInOutBack,
                            duration: Duration(milliseconds: issolid == true ? 0 : 500),
                            child: Icon( on == true ? Icons.highlight_remove_rounded : Icons.add, color: Colors.black),
                            decoration: BoxDecoration(
                              color: Color(0x7CD0D0D0),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Color(0xBE505050),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x51000000),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset:
                                  Offset(0, 2),  // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          onTap: widget.action,
                        ),
                      ),
                      MouseRegion(
                        onHover: white2,
                        onExit: blue2,
                        child: AnimatedContainer(
                          width: MediaQuery.of(context).size.width / 1.44,
                          height: isanythingopen == true
                              ? 49
                              : cc2 == true
                                  ? 49
                                  : 70,
                          duration: Duration(milliseconds: issolid == true ? 0 : 500),
                          curve: Curves.easeInOutBack,
                          child: Center(
                              child: Text(
                                widget.ftext,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,

                                  fontFamily: 'Schyler',
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0.0, 1.0),
                                      blurRadius: 3.0,
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                              )),
                          decoration: BoxDecoration(
                          color: Color(0x62B6B4B4),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color(0xBE505050),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x51000000),
                                spreadRadius: 1,
                                blurRadius: 6,
                                offset:
                                Offset(0, 2),  // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ),
                      MouseRegion(
                        onHover: white2,
                        onExit: blue2,
                        child: InkWell(
                          onTap: widget.saction,
                          child: AnimatedContainer(
                            width: MediaQuery.of(context).size.width > 800
                                ? isanythingopen == true
                                ? cc2 == true
                                ? /* if something open, what will it be smaller */ 50
                                : /* if something open, what will it be bigger */ 65
                                : /* if media more than 800 */ 100
                                : isanythingopen == true
                                ? cc2 == true
                                ? /* if something open, what will it be smaller */ 50
                                : /* if something open, what will it be bigger */ 65
                                : /* if media less than 800 */ 50,
                            height: isanythingopen == true
                                ? 49
                                : cc2 == true
                                    ? 49
                                    : 70,
                            duration: Duration(milliseconds: issolid == true ? 0 : 700),
                            curve: Curves.easeInOutBack,
                            child: Icon( settingson == true ? Icons.highlight_remove_rounded : Icons.settings, color: Colors.black),
                            decoration: BoxDecoration(
                              color: Color(0x7CD0D0D0),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Color(0xBE505050),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x51000000),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset:
                                  Offset(0, 2),  // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 30,
                height: 11,
              )
            ],
          ),
        ],
      ),
    );
  }
}
