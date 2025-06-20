
import 'package:flutter/material.dart';
import 'package:hybriidflow/widgets/bottombar.dart';
import 'package:hybriidflow/widgets/fullscreencentertext.dart';
import 'package:hybriidflow/widgets/slots/def.dart';
import 'package:hybriidflow/widgets/slots/timeanddate.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:async';
import 'main.dart';
import 'package:intl/intl.dart';
import 'package:universal_io/io.dart';

class simplepage extends StatefulWidget {
  static const String route = '/simple';
  @override
  _simplepageState createState() => _simplepageState();
}

class _simplepageState extends State<simplepage> {
  void initState() {
    super.initState();

    // ignore: undefined_prefixed_name
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the overview page using a named route.
        Navigator.push(context,
            PageTransition(type: PageTransitionType.fade, child: mainpage()));
      },
      child: Scaffold(
        backgroundColor: Color(0xFF454545),
        body: Stack(
          children: [
            hilly(),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Color(0x54C7C7C7),
            ),
            Center(
              child: PageView(
                children: [
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              color: Color(0xD5343434),
                              width: 500,
                              height: 900,
                              child: dict()),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
