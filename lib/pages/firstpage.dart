
import 'package:flutter/material.dart';
import 'package:hybriidflow/widgets/bottombar.dart';
import 'package:hybriidflow/widgets/fullscreencentertext.dart';
import 'package:hybriidflow/widgets/startupanimation.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:async';
import 'main.dart';
import 'package:universal_io/io.dart';

class firstpage extends StatefulWidget {
  static const String route = '/welcome';
  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  String hybriidtext = "Let's get you started!";
  bool _visible = false;
  bool startupvis = true;

  Future<void> playy() async {
    print('2nd working');

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        hybriidtext = "Tap Anywhere";
      });
    });
  }

  Future<void> startup() async {
    await Future.delayed(Duration(milliseconds: 1), () {
      setState(() {
        _visible = !_visible;

      });
    });
    await Future.delayed(Duration(seconds: 1), () {
      startupvis = false;
    });
  }

  void initState() {
    super.initState();
    playy();
    startup();
  }

  @override
  Widget build(BuildContext context) {
    print("first page");
    return GestureDetector(
      onTap: () {
        // Navigate to the overview page using a named route.
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade, child: mainpage()));
      },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Stack(
          children: [
            hilly(),
            Container(
              width: double.infinity,
              height: double.infinity,
              color:
                   Color(0x43262626)

            ),
            fstext(
              text: ('Welcome to HybriidFlow'),
              text2: (hybriidtext),

              color: Colors.white,
              color2: Color(0xff144790),
            ),
            StartAnim(vis1: startupvis, vis2: _visible,),

          ],
        ),
      ),
    );
  }
}
