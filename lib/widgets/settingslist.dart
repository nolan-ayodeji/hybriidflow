import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hybriidflow/global/globvabs.dart';
import 'package:hybriidflow/widgets/infowidget.dart';
import 'package:hybriidflow/widgets/settings.dart';
import 'dart:math' as math;

double sizeforsized = 10;

class SettingOptions extends StatefulWidget {
  final option1;
  final option2;
  final o1text;
  final o2text;
  final effectant;
  final option3;
  final o3text;
  final option4;
  final o4text;
  final option5;
  final o5text;
  final option6;
  final o6text;
  final option7;
  final o7text;
  final option8;
  final o8text;
  final option0;
  final o0text;
  final option50;
  final o50text;

  const SettingOptions({
    Key? key,
    this.option1,
    this.o1text,
    this.o2text,
    this.effectant,
    this.option2,
    this.option3,
    this.o3text,
    this.option4,
    this.o4text,
    this.option5,
    this.o5text,
    this.option6,
    this.o6text,
    this.option7,
    this.o7text,
    this.option8,
    this.o8text,
    this.option0,
    this.o0text, this.option50, this.o50text,
  }) : super(key: key);
  @override
  _SettingOptionsState createState() => _SettingOptionsState();
}

class _SettingOptionsState extends State<SettingOptions> {
  final _cr = ScrollController();
  double _currentSliderValue = 500;
  void cval(wtc) {}
  final _height = 100.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Listener(
          onPointerSignal: (ps) {
            if (ps is PointerScrollEvent) {
              final newOffset = _cr.offset + ps.scrollDelta.dy;
              if (ps.scrollDelta.dy.isNegative) {
                _cr.jumpTo(math.max(0, newOffset));
              } else {
                _cr.jumpTo(math.min(_cr.position.maxScrollExtent, newOffset));
              }
            }
          },
          child: Center(
            child: Scrollbar(
              thumbVisibility: true,
              controller: _cr,
              child: SingleChildScrollView(
                child: Column(
                             
                  children: <Widget>[
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: sizeforsized,
                        ),
                
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 30,
                          child: FittedBox(
                              child: Text(
                            'Desktop Settings',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Color(0xffe5e5e5),
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(0.0, 1.0),
                                    blurRadius: 3.0,
                                    color: Colors.black26,
                                  ),
                                ],
                                fontFamily: 'Schyler'),
                          )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          runSpacing: 15.0,
                          alignment: WrapAlignment.center,
                          children: [
                            option(
                              s: widget.option1,
                              stext: widget.o1text,
                              textsize: 17,
                              ogtextl: 'Backdrop Brightness',
                            ),
                            SizedBox(
                              width: sizeforsized,
                            ),
                            option(
                              s: widget.option3,
                              stext: widget.o3text,
                              textsize: 14,
                              ogtextl: 'Smooth Graphics',
                            ),
                            SizedBox(
                              width: sizeforsized,
                            ),
                            changewall(),
                            SizedBox(
                              width: sizeforsized,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 30,
                              child: FittedBox(
                                  child: Text(
                                'Widget Settings',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xffe5e5e5),
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(0.0, 1.0),
                                        blurRadius: 3.0,
                                        color: Colors.black26,
                                      ),
                                    ],
                                    fontFamily: 'Schyler'),
                              )),
                            ),SizedBox(
                              width: sizeforsized,
                            ),
                
                            // Visibility(
                            //     child: option(
                            //   ogtextl: 'Scrollable Widgets (If screen is too small)',
                            //   stext: widget.o4text,
                            //   textsize: 14,
                            //   s: widget.option4,
                            // )),
                            // SizedBox(
                            //   width: sizeforsized,
                            // ),
                            Visibility(
                              visible: MediaQuery.of(context).size.width < 600
                                  ? false
                                  : true,
                              child: multi(
                                s: widget.option3,
                                stext: widget.o3text,
                                textsize: 20,
                                ogtextl: 'Widget Size',
                              ),
                            ),
                            SizedBox(
                              width: sizeforsized,
                            ),
                            InkWell(
                              child: multi2(
                                s: widget.option3,
                                stext: widget.o3text,
                                textsize: 20,
                                ogtextl: 'Widget Color',
                              ),
                            ),
                            SizedBox(
                              width: sizeforsized,
                            ),
                            Visibility(
                                child: option(
                              ogtextl: 'Widget Border',
                              stext: widget.o8text,
                              textsize: 19,
                              s: widget.option8,
                            )),
                            SizedBox(
                              width: sizeforsized,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 30,
                              child: FittedBox(
                                  child: Text(
                                'Dock Settings',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xffe5e5e5),
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(0.0, 1.0),
                                        blurRadius: 3.0,
                                        color: Colors.black26,
                                      ),
                                    ],
                                    fontFamily: 'Schyler'),
                              )),
                            ),
                            option(
                              ogtextl: 'Dock Style',
                              s: widget.option50,
                              stext: widget.o50text,
                              textsize: 20,
                            ),
                            SizedBox(
                              width: sizeforsized,
                            ),
                            option(
                              ogtextl: 'Show Widget Count',
                              s: widget.option5,
                              stext: widget.o5text,
                              textsize: 20,
                            ),
                            SizedBox(
                              width: sizeforsized,
                            ),
                            option(
                              ogtextl: 'Show Battery Percentage (Beta)',
                              s: widget.option0,
                              stext: widget.o0text,
                              textsize: 15,
                            ),
                            SizedBox(
                              width: sizeforsized,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 30,
                              child: FittedBox(
                                  child: Text(
                                    'Other Settings',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xffe5e5e5),
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(0.0, 1.0),
                                            blurRadius: 3.0,
                                            color: Colors.black26,
                                          ),
                                        ],
                                        fontFamily: 'Schyler'),
                                  )),
                            ),
                            option(
                              ogtextl: 'Show Welcome Text',
                              s: widget.option6,
                              stext: widget.o6text,
                              textsize: 15,
                            ),
                            SizedBox(
                              width: sizeforsized,
                            ),
                            option(
                              ogtextl: 'Show Random Widget Button',
                              s: widget.option7,
                              stext: widget.o7text,
                              textsize: 15,
                            ),
                
                            SizedBox(
                              height: 150,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 30,
                              child: FittedBox(
                                  child: Text(
                                'hybriidFlow Help',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xffe5e5e5),
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(0.0, 1.0),
                                        blurRadius: 3.0,
                                        color: Colors.black26,
                                      ),
                                    ],
                                    fontFamily: 'Schyler'),
                              )),
                            ),
                            sendfeedback(),
                            SizedBox(
                              height: 90,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
