import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hybriidflow/global/globvabs.dart';
import 'package:hybriidflow/pages/main.dart';
import 'package:hybriidflow/widgets/infowidget.dart';
import 'package:hybriidflow/widgets/wallpaper.dart';
import 'package:mailto/mailto.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hybriidflow/widgets/wallpaper.dart';

import '../providers/appmodel.dart';
class option extends StatefulWidget {
  final s;
  final stext;
  final ogtextl;
  final textsize;

  const option(
      {Key? key,
      this.s,
      this.stext,
      this.ogtextl = 'Error Retrieving the Setting',
      this.textsize = 30})
      : super(key: key);
  @override
  _optionState createState() => _optionState();
}

class _optionState extends State<option> {
  bool cc = true;

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
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: anim,
      onExit: white,

      child: InkWell(
        onTap: widget.s,
        child: AnimatedContainer(
          width: cc == true ? 240 : 250,
          curve: Curves.easeInOutCirc,
          height: cc == true ? 94 : 104,
          duration: Duration(milliseconds: issolid == true ? 0 : 300),
          decoration: BoxDecoration(
            //colors
            color: Color(0xda191919),
            borderRadius: BorderRadius.circular(38),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                cc == false ?  Color(0x991E1E1E) : Color(0xBE626162),
                cc == true ? Color(0x991E1E1E) : Color(0xBE626162),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Container(
                  width: 150,
                  height: 50,
                  child: Center(
                    child: Text(
                      widget.ogtextl,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: widget.textsize,
                          color: Color(0xffe5e5e5),
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.0, 1.0),
                              blurRadius: 3.0,
                              color: Colors.black26,
                            ),
                          ],
                          fontFamily: 'Schyler'),
                    ),
                  ),
                ),

                Container(
                  width: 160,
                  height: 20,
                  child: FittedBox(
                    child: Text(
                      widget.stext,

                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color(0xff7BF4C5),

                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.0, 1.0),
                              blurRadius: 3.0,
                              color: Colors.black26,
                            ),
                          ],
                          fontFamily: 'Schyler'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class multi extends StatefulWidget {
  final s;
  final stext;
  final ogtextl;
  final textsize;

  const multi(
      {Key? key,
      this.s,
      this.stext,
      this.ogtextl = 'Error Retrieving Setting',
      this.textsize = 30})
      : super(key: key);
  @override
  _multiState createState() => _multiState();
}

class _multiState extends State<multi> {

  void small() {
    setState(() {
      settingsize.value = 400;
      first = true;
      second = false;
      third = false;
    });
  }

  void medium() {
    setState(() {
      settingsize.value = 600;
      first = false;
      second = true;
      third = false;
    });
  }

  bool blackyes = false;



  void large() {
    setState(() {
      settingsize.value = 800;
      first = false;
      second = false;
      third = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 400,
      curve: Curves.easeInOutCirc,
      height: 94,
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        //colors
        color: Color(0xda191919),
        borderRadius: BorderRadius.circular(38),
        border: Border.all(
          color: Colors.white,
          width: 2,
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
      child: Center(
        child: Column(
          children: [

            Container(
              width: 150,
              height: 45,
              child: Center(
                child: Text(
                  widget.ogtextl,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 17,
                      color: Color(0xffe5e5e5),
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0.0, 1.0),
                          blurRadius: 3.0,
                          color: Colors.black26,
                        ),
                      ],
                      fontFamily: 'Schyler'),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: small,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOutCirc,
                    width: 90,
                    height: 33,
                    decoration: BoxDecoration(
                      color:  Color(0x32FFFFFF),
                      borderRadius: BorderRadius.circular(30),
                      border:Border.all(
                        color: first == true ? Color(0xe249a054) : Colors.grey,
                        width: first == true ? 3 : 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Small',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: widget.textsize,
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
                    ),
                  ),
                ),
                InkWell(
                  onTap: medium,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOutCirc,
                    width: 90,
                    height: 33,
                    child: Center(
                      child: Text(
                        'Medium',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: widget.textsize,
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
                    ),

                    decoration: BoxDecoration(
                                               color:  Color(0x32FFFFFF),
                                               borderRadius: BorderRadius.circular(30),
                                               border:Border.all(
                                               color: second == true ? Color(0xe249a054) : Colors.grey,
                                               width: second == true ? 3 : 2,
                                             ),
                                             ),
                  ),
                ),
                InkWell(
                  onTap: large,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOutCirc,
                    width: 90,
                    height: 33,
                    child: Center(
                      child: Text(
                        'Large',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: widget.textsize,
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
                    ),
                    decoration: BoxDecoration(
                      color:  Color(0x32FFFFFF),
                      borderRadius: BorderRadius.circular(30),
                      border:Border.all(
                        color: third == true ? Color(0xe249a054) : Colors.grey,
                        width: third == true ? 3 : 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class multi2 extends StatefulWidget {
  final s;
  final stext;
  final ogtextl;
  final textsize;

  const multi2(
      {Key? key,
      this.s,
      this.stext,
      this.ogtextl = 'Error Retrieving Setting',
      this.textsize = 30})
      : super(key: key);
  @override
  _multi2State createState() => _multi2State();
}

class _multi2State extends State<multi2> {
  void darkgrey() {
    setState(() {
      final ref = Provider.of<AppModel>(context, listen: false);
      ref.widgetcolor = Color(0x7a555555);
      ref.updateColor(Color(0x7a555555));
    });
  }

  void lightgrey() {
    setState(() {
      final ref = Provider.of<AppModel>(context, listen: false);
      ref.widgetcolor = Color(0x7acdcdcd);
      ref.updateColor(Color(0x7acdcdcd));
    });
  }

  void black() {
    setState(() {
      final ref = Provider.of<AppModel>(context, listen: false);
      ref.widgetcolor = Color(0x7a000000);
      ref.updateColor(Color(0x7a000000));
    });
  }

  void coloron() {
    setState(() {
      final ref = Provider.of<AppModel>(context, listen: false);
      choosecolor = true;

    });
  }

  void coloroff() {
    setState(() {
      choosecolor = false;
      choosecolordelayed = false;
    });
  }

  void white() {
    setState(() {
      final ref = Provider.of<AppModel>(context, listen: false);
      ref.widgetcolor = Color(0x8dffffff);
      ref.updateColor(Color(0x7aad3131));
    });
  }

  void pink() {
    setState(() {
      final ref = Provider.of <AppModel>(context, listen: false);
      ref.widgetcolor = Color(0x7aff66da);
      ref.updateColor(Color(0x7aad3131));
    });
  }

  void red() {
    setState(() {
      final ref = Provider.of<AppModel>(context, listen: false);
      ref.widgetcolor = Color(0x7aad3131);
      ref.updateColor(Color(0x7aad3131));
    });
  }

  void blue() {
    setState(() {
      final ref = Provider.of<AppModel>(context, listen: false);
      ref.widgetcolor = Color(0x7a4dd1e8);
      ref.updateColor(Color(0x7a4dd1e8));

    });
  }

  void green() {
    setState(() {
      final ref = Provider.of<AppModel>(context, listen: false);
      ref.updateColor(Color(0x7a46c138));


    });
  }

  bool choosecolor = false;
  bool choosecolordelayed = false;

  bool blackyes = false;
  Color thecolor = Color(0x32FFFFFF);

  void blk(PointerEvent details){
    setState(() {
      thecolor = Color(0xC2424242);
    });
  }
  void noblk(PointerEvent details){
    setState(() {
      thecolor = Color(0x32FFFFFF);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 400,
      curve: Curves.easeInOutCirc,
      height: choosecolor == true ? 380 : 94,
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        //colors
        color: Color(0xda191919),
        borderRadius: BorderRadius.circular(38),
        border: Border.all(
          color: Colors.white,
          width: 2,
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
      child: Center(
        child: Column(
          children: [

            Container(
              width: 120,
              height: 44,
              child: Center(
                child: Text(
                  widget.ogtextl,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                      color:Colors.white,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0.0, 1.0),
                          blurRadius: 3.0,
                          color: Colors.black26,
                        ),
                      ],
                      fontFamily: 'Schyler'),
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            if (choosecolordelayed == true) ...[
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: darkgrey,
                        child: Container(
                          width: 90,
                          height: 50,
                          decoration: BoxDecoration(
                            color:  Color(0x32FFFFFF),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Center(
                              child: Text(
                                'Dark Grey (Default)',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15,
                                    color:Colors.white,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(0.0, 1.0),
                                        blurRadius: 3.0,
                                        color: Colors.black26,
                                      ),
                                    ],
                                    fontFamily: 'Schyler'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: lightgrey,
                        child: Container(
                          width: 90,
                          height: 50,
                          child: Center(
                            child: Text(
                              'Light Grey',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                  color:Colors.white,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0.0, 1.0),
                                      blurRadius: 3.0,
                                      color: Colors.black26,
                                    ),
                                  ],
                                  fontFamily: 'Schyler'),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color:  Color(0x32FFFFFF),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: black,
                        child: Container(
                          width: 90,
                          height: 50,
                          child: Center(
                            child: Text(
                              'Black',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: widget.textsize,
                                  color:Colors.white,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0.0, 1.0),
                                      blurRadius: 3.0,
                                      color: Colors.black26,
                                    ),
                                  ],
                                  fontFamily: 'Schyler'),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color:  Color(0x32FFFFFF),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: white,
                        child: Container(
                          width: 90,
                          height: 50,
                          decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Center(
                              child: Text(
                                'White',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15,
                                    color: Color(0xff101010),
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(0.0, 1.0),
                                        blurRadius: 3.0,
                                        color: Colors.black26,
                                      ),
                                    ],
                                    fontFamily: 'Schyler'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: pink,
                        child: Container(
                          width: 90,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xffd155e8),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Center(
                              child: Text(
                                'Pink',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15,
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
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: blue,
                        child: Container(
                          width: 90,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xff19b6c4),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Center(
                              child: Text(
                                'Blue',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15,
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
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: red,
                        child: Container(
                          width: 90,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xffc41919),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Center(
                              child: Text(
                                'Red',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15,
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
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: green,
                        child: Container(
                          width: 90,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xff74c419),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Center(
                              child: Text(
                                'Green',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15,
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
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          coloroff();
                          setState(() {
                            bigsettings = false;
                          });
                        },
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Center(
                              child: Text(
                                'Close Color Picker',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15,
                                    color: Color(0xff101010),
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(0.0, 1.0),
                                        blurRadius: 3.0,
                                        color: Colors.black26,
                                      ),
                                    ],
                                    fontFamily: 'Schyler'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ] else ...[
              InkWell(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      bigsettings = true;
                    });
                    coloron();

                    Future.delayed(Duration(milliseconds: 300), () {
                      setState(() {
                        choosecolordelayed = true;
                      });
                    });
                  },
                  child: MouseRegion(
                    onHover: blk,
                    onExit: noblk,
                    child: Container(
                      width: 300,
                      height: 30,
                      child: Center(
                        child: Text(
                          'Tap to open Color Picker',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
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
                      ),
                      decoration: BoxDecoration(
                        color:  thecolor,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class sendfeedback extends StatelessWidget {
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
    return InkWell(
      onTap: launchMailto,
      child: Container(
        width: 320,
        height: 50,
        child: Center(
          child: Text(
            'Contact @hybriidbox.apps',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 15,
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
        ),
        decoration: BoxDecoration(
          //colors
          color: Color(0xda191919),
          borderRadius: BorderRadius.circular(38),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0x991E1E1E),
              Color(0xBE626162),
            ],
          ),
        ),
      ),
    );
  }
}

class changewall extends StatefulWidget {
  @override
  _changewallState createState() => _changewallState();
}

class _changewallState extends State<changewall> {
  bool hovered = false;

  Future<void> truehover(PointerEvent details) async {

    await Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        hovered = true;
      });
    });
  }


  void falsehover(PointerEvent details){
    setState(() {
      hovered = false;
    });
  }

  bool cc = true;

  void white(PointerEvent details) {
    setState(() {
      cc = true;
    });
  }

  Future<void> anim(PointerEvent details) async {
     setState(() {
      cc = false;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MouseRegion(

          onExit: falsehover,
          child: MouseRegion(
            onHover: anim,
            onExit: white,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: AddWallpaper()));
              },
              child: AnimatedContainer(

                width: cc == true ? 230 : 240,
                curve: Curves.easeInOutCirc,
                height: cc == true ? 94 : 104,
                duration: Duration(milliseconds: issolid == true ? 0 : 300),
                child: Center(
                  child: Text(
                   "Change Wallpaper",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                        color: Color(0xffe5e5e5),
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0.0, 1.0),
                            blurRadius: 3.0,
                            color: Colors.black26,
                          ),
                        ],
                        fontFamily: 'Schyler'),
                  ),
                ),
                decoration: BoxDecoration(
                  //colors
                  color: Color(0xda191919),
                  borderRadius: BorderRadius.circular(38),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
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
              ),
            ),
          ),
        ),
        Visibility(
          visible: hovered,
          child: Stack(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    showwall = true;
                  });
                },
                child: MouseRegion(
                  onHover: truehover,
                  onExit: falsehover,
                  child: MouseRegion(
                    onHover: anim,
                    onExit: white,

                    child: AnimatedContainer(

                      width: cc == true ? 230 : 380,
                      curve: Curves.easeInOutCirc,
                      height: cc == true ? 120 : 190,
                      duration: Duration(milliseconds: issolid == true ? 0 : 300),
                      child: Center(

                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/hilly2-min.png'),
                          fit: BoxFit.cover,
                        ),
                        color: Color(0xda191919),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.white,
                          width: 1.3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
