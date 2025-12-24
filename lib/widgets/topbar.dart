import 'dart:io';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hybriidflow/global/globvabs.dart';
import 'package:hybriidflow/pages/main.dart';
import 'package:hybriidflow/pages/time.dart';
import 'package:hybriidflow/pages/unknown.dart';
import 'package:hybriidflow/widgets/warning.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:mailto/mailto.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hybriidflow/providers/appmodel.dart';

String currenterror = "";

class topbar extends StatefulWidget {
  final ftext;
  final action;
  final saction;
  final widgetexist;
  final action2;

  const topbar({key, this.ftext, this.action, this.saction, this.widgetexist, this.action2})
      : super(key: key);
  @override
  _topbarState createState() => _topbarState();
}

class _topbarState extends State<topbar> {
  Color top = Colors.grey.withOpacity(1);
  Color top2 = Colors.grey.withOpacity(0.5);
  bool cc = true;
  String mm = 'FE';

  bool cc2 = true;
  bool ver1 = false;
  bool ver2 = false;
  bool ver3 = false;
  bool rounded = true;

  bool cc4 = false;

  void setcc4(PointerEvent details) {
    setState(() {
      cc4 = true;
    });
  }
  void unsetcc4(PointerEvent details) {
    setState(() {
      cc4 = false;
    });
  }

  void changever(PointerEvent details) {
    setState(() {
      ver1 = true;
      rounded = false;
    });
  }

  void unver(PointerEvent details) {
    setState(() {
      ver1 = false;
      rounded = true;
    });
  }


  void changever3(PointerEvent details) {
    setState(() {
      ver3 = true;
    });
  }

  void unver3(PointerEvent details) {
    setState(() {
      ver3 = false;
    });
  }

  void changever2(PointerEvent details) {
    setState(() {
      ver2 = true;
    });
  }

  void unver2(PointerEvent details) {
    setState(() {
      ver2 = false;
    });
  }

  void white(PointerEvent details) {
    setState(() {
      cc = true;
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
  User? user = FirebaseAuth.instance.currentUser;

  DateTime now = DateTime.now();
  void gettime() {
    setState(() {
      now = DateTime.now();
    });

    Future.delayed(Duration(seconds: 1), () {
      gettime();
    });
  }

  launchMailto() async {
    final mailtoLink = Mailto(
      to: ['hybriidbox@gmail.com'],
      subject: 'Hybriidflow Feedback ',
      body: '',
    );
    // Convert the Mailto instance into a string.
    // Use either Dart's string interpolation
    // or the toString() method.
    await launch('$mailtoLink');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 4,
        ),
        MouseRegion(
          onHover: anim,
          onExit: white,
          child: ClipRRect(
            borderRadius:  BorderRadius.circular(30.0),

            child: AnimatedContainer(
              width: MediaQuery.of(context).size.width / 1.013.clamp(0.0, double.infinity),
              height: cc == true ? 32 : 39,
              duration: Duration(milliseconds: issolid == true ? 0 : 320),
              curve: Curves.easeOutBack,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {Navigator.of(context).pushNamed(timepage.route);},
                            child: Tooltip(
                              message: 'Start Screen Saver',
                              height: 1.5,

                              decoration: BoxDecoration(
                                //colors
                                color: Color(0xDD383838),
                                borderRadius: BorderRadius.circular(38),
                                border: Border.all(
                                  color: Colors.white60,
                                  width: 1,
                                ),

                              ),
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0.0, 1.0),
                                      blurRadius: 3.0,
                                      color: Colors.black54,
                                    ),
                                  ],
                                  fontFamily: 'Schyler'),
                              child: MouseRegion(
                                onEnter: changever,
                                onExit: unver,
                                child: AnimatedContainer(
                                    width: 35,
                                    height: cc == true ? 39 : 44,
                                    duration: Duration(
                                        milliseconds: issolid == true ? 0 : 100),
                                    decoration: BoxDecoration(
                                      color: ver1 == true
                                          ? Color(0x3C505050)
                                          : Color(0x0),
                                    ),
                                    child: Icon(
                                      Icons.power_settings_new,
                                      color: Colors.black38,
                                      size: 20,
                                    )),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              opened = false;
                              setState(() {
                                //entries2.clear();
                                widget.action2();

                              });
                            },
                            child: Tooltip(
                              message: 'Remove All Widgets',
                              height: 2.5,
                              decoration: BoxDecoration(
                                //colors
                                color: Color(0xDD383838),
                                borderRadius: BorderRadius.circular(38),
                                border: Border.all(
                                  color: Colors.white60,
                                  width: 1,
                                ),

                              ),
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.redAccent,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0.0, 1.0),
                                      blurRadius: 3.0,
                                      color: Colors.black54,
                                    ),
                                  ],
                                  fontFamily: 'Schyler'),
                              child: MouseRegion(
                                onEnter: changever2,
                                onExit: unver2,
                                child: AnimatedContainer(
                                    width: 35,
                                    height: cc == true ? 39 : 44,
                                    duration: Duration(
                                        milliseconds: issolid == true ? 0 : 100),
                                    decoration: BoxDecoration(
                                      color: ver2 == true
                                          ? Color(0x3C505050)
                                          : Color(0x0),
                                    ),
                                    child: Icon(
                                      Icons.highlight_remove_rounded,
                                      color: Colors.black38,
                                      size: 20,
                                    )),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              opened = false;
                              setState(() {
                                //entries2.clear();
                                widget.action2();

                              });
                            },
                            child: Tooltip(
                              message: 'Save Widgets',
                              height: 2.5,
                              decoration: BoxDecoration(
                                //colors
                                color: Color(0xDD383838),
                                borderRadius: BorderRadius.circular(38),
                                border: Border.all(
                                  color: Colors.white60,
                                  width: 1,
                                ),

                              ),
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0.0, 1.0),
                                      blurRadius: 3.0,
                                      color: Colors.black54,
                                    ),
                                  ],
                                  fontFamily: 'Schyler'),
                              child: MouseRegion(
                                onEnter: changever3,
                                onExit: unver3,
                                child: AnimatedContainer(
                                    width: 35,
                                    height: cc == true ? 39 : 44,
                                    duration: Duration(
                                        milliseconds: issolid == true ? 0 : 100),
                                    decoration: BoxDecoration(
                                      color: ver3 == true
                                          ? Color(0x3C505050)
                                          : Color(0x0),
                                    ),
                                    child: Icon(
                                      Icons.save,
                                      color: Color(0x838FD568),
                                      size: 20,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Tooltip(
                        message: 'View Account Info',
                        height: 1.2,

                        decoration: BoxDecoration(
                          //colors
                          color: Color(0xDD383838),
                          borderRadius: BorderRadius.circular(38),
                          border: Border.all(
                            color: Colors.white60,
                            width: 1,
                          ),

                        ),
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(0.0, 1.0),
                                blurRadius: 3.0,
                                color: Colors.black54,
                              ),
                            ],
                            fontFamily: 'Schyler'),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Consumer<AppModel>(
                              builder: (context, value, child) {
                              return MouseRegion(
                                onHover: setcc4,
                                onExit: unsetcc4,

                                child: InkWell(
                                  onTap: (){

                                    setState(() {
                                      value.setlog();
                                    });

                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 350),
                                    curve: Curves.easeInOutBack,
                                    width: cc4 != true ? 95 : 100,
                                    height: 33,
                                    decoration: BoxDecoration(
                                      //colors
                                      color: Color(0xda191919),
                                      borderRadius: BorderRadius.circular(38),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: <Color>[
                                          Color(0xBE626162),
                                          Color(0x991E1E1E),

                                        ],
                                      ),
                                    ),
                                    child: StreamBuilder(
                                      stream: FirebaseAuth.instance.authStateChanges(),
                                      builder: (context, snapshot) {


                                        return Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                        
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(
                                                  Icons.account_circle,
                                                  color: Colors.white,
                                                  size: 10,
                                                ),

                                                Text(
                                                  snapshot.data?.displayName != null ? "${snapshot.data?.displayName}" : "Log In",
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w900,
                                                      fontSize: 10,
                                                      color: Colors.white,
                                                      shadows: <Shadow>[
                                                        Shadow(
                                                          offset: Offset(0.0, 1.0),
                                                          blurRadius: 3.0,
                                                          color: Colors.black26,
                                                        ),
                                                      ],
                                                      fontFamily: 'Schyler'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                    ),


                                  ),
                                ),
                              );
                            }
                          ),
                        ),
                      ),
                      // Text(
                      //   '${DateFormat('yMMMMd').format(now)}',
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.w900,
                      //       color: Colors.black45,
                      //       fontSize: 13,
                      //       shadows: <Shadow>[
                      //         Shadow(
                      //           offset: Offset(0.0, 1.0),
                      //           blurRadius: 3.0,
                      //           color: Colors.black12,
                      //         ),
                      //       ],
                      //       fontFamily: 'Schyler'),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(4.0),
                      //   child: AnimatedContainer(
                      //     duration: Duration(milliseconds: 300),
                      //     curve: Curves.easeInOutCirc,
                      //     width: 90,
                      //     height: 33,
                      //     child: Center(
                      //       child: Text(
                      //         'FlowAI',
                      //         style: TextStyle(
                      //             fontWeight: FontWeight.w900,
                      //             fontSize: 10,
                      //             color: Colors.white,
                      //             shadows: <Shadow>[
                      //               Shadow(
                      //                 offset: Offset(0.0, 1.0),
                      //                 blurRadius: 3.0,
                      //                 color: Colors.black26,
                      //               ),
                      //             ],
                      //             fontFamily: 'Schyler'),
                      //       ),
                      //     ),
                      //
                      //     decoration: BoxDecoration(
                      //       color:  Color(0x32A2E784),
                      //       borderRadius: BorderRadius.circular(30),
                      //       border:Border.all(
                      //         color: Color(0xe28cc993),
                      //         width: 1,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Row(
                        children: [
                          Opacity(
                            child: Container(
                              width: 100,
                              height: 20,
                              child: FittedBox(
                                child: Image(image: AssetImage('assets/minum10.png')),
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),

                            ),
                              opacity:0.55,
                          ),
                          SizedBox(
                            width: 35,
                          )
                        ],
                      ),
                    ],
                  ),
                  Visibility(
                    visible: false,
                    child: Center(
                      child: Container(
                        width: 270,
                        height: 25,
                        child: Stack(
                          children: [
                            Text(
                              '${currenterror}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  fontSize: 14,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0.0, 1.0),
                                      blurRadius: 3.0,
                                      color: Colors.black54,
                                    ),
                                  ],
                                  fontFamily: 'Schyler'),
                            ),
                            Row(
                              children: [
                                MouseRegion(
                                  child: AnimatedContainer(
                                      width: 30,
                                      height: 25,
                                      duration: Duration(
                                          milliseconds: issolid == true ? 0 : 200),
                                      curve: Curves.easeInOutCirc,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(22),
                                            bottomLeft: Radius.circular(22),
                                            topRight: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                          ),
                                          color: Color(0xFF595757)),
                                      child: Center(
                                          child: Icon(Icons.highlight_remove,
                                              size: 19))),
                                ),
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF757474),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Color(0xBE505050),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x51000000),
                              spreadRadius: 0.2,
                              blurRadius: 6,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0x6FADADAD),
                borderRadius: BorderRadius.circular(22),
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
                    Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
