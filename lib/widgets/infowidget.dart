import 'package:flutter/material.dart';
import 'package:hybriidflow/global/globvabs.dart';

// import 'dart:io' if (dart.library.html) 'dart:ui' as ui;
import 'dart:ui' as ui;
import 'dart:html';

import 'package:hybriidflow/widgets/fullscreencentertext.dart';
import 'package:hybriidflow/widgets/slots/livedate.dart';
import 'package:hybriidflow/widgets/slots/livetime.dart';
import 'package:provider/provider.dart';

import '../providers/appmodel.dart';

// ignore: camel_case_types
// ignore: undefined_prefixed_name
String src = 'https://www.calculatorsoup.com/calculators/math/adding-fractions-calculator.php?src=link_direct';
ValueNotifier<double> settingsize = ValueNotifier(400);



bool border = true;

class infowidget extends StatefulWidget {
  final slot;
  final what;
  final dupl;
  final sshow;

  const infowidget({super.key, this.slot, this.what, this.dupl, this.sshow});

  @override
  _infowidgetState createState() => _infowidgetState();
}

class _infowidgetState extends State<infowidget> with AutomaticKeepAliveClientMixin {
  int test = 3;
  int milseconds = 100;
  String ss = src;
  late bool showsetting;
  bool get wantKeepAlive => true;




  Color top = Color(0xffff5952);
  Color top2 = Color(0xb9e7c029);

  bool shouldshow = true;
  bool showtext = true;
  bool wann = true;
  void wanim() {



    Future.delayed(Duration(milliseconds: milseconds), () {
      setState(() {
        wann = false;
      });
      setState(() {

      });
    });
  }

  void checkifsettings(){
    setState(() {
      showtext = widget.sshow;
    });
  }

  void white(PointerEvent details) {
    setState(() {
      top = Colors.grey.withOpacity(1);
    });
  }

  void bright(PointerEvent details) {
    setState(() {
      top = Color(0xffdeffc4);
    });
  }
  bool cc2 = true;

  bool cc = true;


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

  void anim2(PointerEvent details) {
    setState(() {
      cc2 = false;
    });
  }

  void falseanim2(PointerEvent details) {
    setState(() {
      cc2 = true;
    });
  }
  void detectsettings() {
    if (widget.sshow == true)
      setState(() {
        showsetting = true;
      });
    else
      setState(() {
        showsetting = false;
      });

  }

  void initState() {
    super.initState();

    wanim();

    checkifsettings();
    detectsettings();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Center(
      child: Stack(
        children: [
          RepaintBoundary(
            child: ValueListenableBuilder(
              valueListenable: settingsize,
              builder: (context, value, child) {
                return Consumer<AppModel>(

                  builder: (context, app, child) {
                    return AnimatedContainer(

                      duration: Duration(milliseconds: issolid == true ? 70 : 496),
                      curve: Curves.easeInOutExpo,
                      width: wann == true ? 50 : MediaQuery.of(context).size.width < 600 ? 400 : value,
                      height: 700,
                      child: Stack(
                        children: [
                          Container(
                            width: value,
                            height: 800,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x555555),
                                  spreadRadius: -12.0,
                                  blurRadius: 12.0,
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: Container(
                              child: widget.slot,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                            
                            ),
                          ),

                        ],
                      ),
                      decoration: BoxDecoration(
                        color: app.widgetcolor,
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(
                          color: border == true ? Colors.black : Colors.black12,
                          width: border == true ? 1.35 : 0.00000001
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: -12.0,
                            blurRadius: 12.0,
                          ),
                        ],
                      ),
                    );
                  }
                );
              }
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: Row(
              children: [

                MouseRegion(
                  onHover: anim,
                  onExit: falseanim,

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),

                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(
                        sigmaX: 2.0,
                        sigmaY: 2.0,
                      ),
                      child: InkWell(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: issolid == true ? 0 : 300),
                          curve: Curves.easeInOutBack,
                          width: cc == true ? 35 : 48,
                          height: 35,

                          child:
                              Icon(Icons.highlight_remove, color: Color(
                                  0xff000000)),
                          decoration: BoxDecoration(
                            //colors
                            color: Color(0xdaff0000),
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(
                              color: Colors.black,
                              width: cc == true ? 0 : 2,
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                cc == true ?  Color(0x4fff6c52)
                                    : Color(0xffff6c52)
                                ,
                                cc == true ? Color(0x4fff6c52)
                                    : Color(0xffff6c52)
                              ],
                            ),
                          ),

                        ),
                        onTap: widget.what,
                      ),
                    ),
                  ),
                ),
                MouseRegion(
                  onHover: anim2,
                  onExit: falseanim2,
                  child: Visibility(
                    visible: false,
                    child: InkWell(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: issolid == true ? 0 : 300),
                        width: cc2 == true ? 30 : 48,
                        curve: Curves.easeInOutBack,
                        height: 30,
                        child: Icon(Icons.control_point_duplicate,
                            color: Color(0xff815a00)),
                        decoration: BoxDecoration(
                            color:
                                cc2 == true ? Color(0xb9e7c029) : Color(0xffe7c029),
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
                            borderRadius: BorderRadius.circular(0)),
                      ),
                      onTap: widget.dupl,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class testtext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('1st option');
  }
}

class testtext2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('2nd option');
  }
}

class testtext3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('3rd option');
  }
}

class seconds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('3rd option');
  }
}

class error extends StatefulWidget {
  final wtd;

  const error({Key? key, this.wtd}) : super(key: key);
  @override
  _errorState createState() => _errorState();
}

class _errorState extends State<error> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
              width: 1000,
              height: 500,
              child: Stack(children: [
                Text(
                  'Loading ${src}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0.0, 1.0),
                        blurRadius: 3.0,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
                HtmlElementView(viewType: 'hello-world-html'),
                Column(
                  children: [],
                ),
              ])),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextFormField(
              onFieldSubmitted: (text) {
                setState(() {
                  src = text;
                });

              },
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 10,
                fontFamily: 'Schyler',
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0.0, 1.0),
                    blurRadius: 3.0,
                    color: Colors.black54,
                  ),
                ],
              ),
              decoration: InputDecoration(
                hintText: "Enter Image Link",
                fillColor: Colors.black,
                focusColor: Colors.black,
                hoverColor: Colors.black,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
