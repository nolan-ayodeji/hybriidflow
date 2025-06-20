import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:translator/translator.dart';

import '../fullscreencentertext.dart';

class ggt extends StatefulWidget {
  const ggt({key}) : super(key: key);

  @override
  _ggtState createState() => _ggtState();
}

class _ggtState extends State<ggt> {
  void initState() {
    super.initState();
  }

  final translator = GoogleTranslator();

  var input = "I am 4 years old";

  String from = 'en';
  String to = 'es';
  String whattostransalate = '';
  String ofcil = '';
  //String otrans = ofcil.toString();

  Future<void> trans() async {
    var translation =
        await translator.translate(whattostransalate, from: from, to: to);
    print(translation);
    setState(() {
      ofcil = translation.text;
      print('HEY ${whattostransalate}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Container(
            child: Text(
              "Don't forget to press enter on Every Text Field!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 10,
                color: Color(0xffc7c7c7),
                fontFamily: 'Schyler',
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0.0, 1.0),
                    blurRadius: 3.0,
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: RichText(
              text: TextSpan(
                text: 'List of Language Codes',
                style: TextStyle(
                  color: Color(0xff7fa7ff),
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Schyler',
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.0, 1.0),
                      blurRadius: 3.0,
                      color: Colors.black26,
                    ),
                  ],
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launch(
                        'https://developers.google.com/admin-sdk/directory/v1/languages');
                  },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            //first
            height: 82,
            decoration:BoxDecoration(
              color: Color(0xda191919),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.white60, Color(0xDCFFFFFF)],
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                            child: Text(
                          'Language to translate from (Language Code)',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Schyler',
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(0.0, 1.0),
                                blurRadius: 3.0,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        initialValue: 'en',
                        onFieldSubmitted: (text) {
                          setState(() {
                            from = text;
                          });
                        },
                        textAlign: TextAlign.center,
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
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Translate from • Example: en = English",
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
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            //second
            height: 82,
            decoration: BoxDecoration(
              color: Color(0xda191919),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.white60, Color(0xDCFFFFFF)],
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                            child: Text(
                          'Language to translate to (Language Code)',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Schyler',
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(0.0, 1.0),
                                blurRadius: 3.0,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        initialValue: 'es',
                        onFieldSubmitted: (text) {
                          setState(() {
                            to = text;
                          });
                        },
                        textAlign: TextAlign.center,
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
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Translate from • Example: es = Spanish",
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
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            //3rd
            height: 82,
            decoration:BoxDecoration(
              color: Color(0xda191919),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.white60, Color(0xDCFFFFFF)],
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                            child: Text(
                          'What to translate (Press Enter)',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Schyler',
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(0.0, 1.0),
                                blurRadius: 3.0,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        onFieldSubmitted: (text) {
                          setState(() {
                            whattostransalate = text;
                            trans();
                          });
                        },
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
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Example: Hello! How are you?",
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
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            //3rd
            height: 82,
            decoration:BoxDecoration(
              color: Color(0xda191919),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.white60, Color(0xDCFFFFFF)],
              ),
            ),
            child: FittedBox(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                              child: Text(
                            'Translation:',
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
                          )),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: SelectableText(
                            ofcil,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontFamily: 'Schyler',
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 3.0,
                                  color: Colors.black26,
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            child: Container(),
          ),
          Visibility(child: Container()),
        ],
      ),
    );
  }
}
