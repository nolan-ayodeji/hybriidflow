import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class qr extends StatefulWidget {
  @override
  _qrState createState() => _qrState();
}

class _qrState extends State<qr> {
  String data = 'hybrid';

  String quality = '230x230';
  String qrcolor ='B9B9B9';
  Color backcolor = Color(0xFFB9B9B9);
  Color border = Colors.white;
  double borderrad = 2;
  double borderradius = 30;

  String url =
      'https://api.qrserver.com/v1/create-qr-code/?size=230x230&data=hybriidflow&bgcolor=B9B9B9';

  void seturl() {
    setState(() {
      url =
          'https://api.qrserver.com/v1/create-qr-code/?size=$quality&data=$data&bgcolor=$qrcolor';
    });
  }

  void highquality() {
    setState(() {
      quality = '1000x1000';
      borderradius = 0;
    });
    seturl();
  }

  void lowquality() {
    setState(() {
      quality = '230x230';
      borderradius = 30;
    });
    seturl();
  }

  void white() {
    setState(() {
      qrcolor = 'FFFFFF';
      backcolor = Colors.white;
      border = Colors.black;
      borderrad = 3;
    });
    seturl();
  }
  void grey() {
    setState(() {
      qrcolor = 'B9B9B9';
      backcolor = Color(0xFFB9B9B9);
      border = Colors.white;
      borderrad = 2;
    });
    seturl();
  }

  bool cc = true;

  bool cc2 = true;





  @override
  Widget build(BuildContext context) {
    print("qr code built");
    return SingleChildScrollView(
      padding: const EdgeInsets.all(23),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () async {
              await canLaunch(url) ? await launch(url) : await launch(url);
            },
            child: MouseRegion(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                curve: Curves.easeInOutCirc,
                width: 320,
                height: 320,
                child: Image.network(url),
                decoration: BoxDecoration(
                  color: Color(0xff808080),
                  borderRadius: BorderRadius.circular(borderradius),
                  border: Border.all(
                    color: border,
                    width: borderrad,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[backcolor, backcolor],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(

            //first
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
                          'Enter a website or text here',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Schyler',
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(0.0, 3.0),
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
                        onFieldSubmitted: (text) {
                          setState(() {
                            data = text;
                            seturl();
                          });
                        },
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 10,
                          fontFamily: 'Schyler',
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.0, 3.0),
                              blurRadius: 3.0,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                        cursorColor: Colors.black,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding:
                            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                            hintText:
                            'example: hybriidflow or https://www.youtube.com/',
                            hintStyle: TextStyle(
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
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            //first
            height: 75,
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
                  height: 5,
                ),
                Stack(
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                              child: Text(
                            'QR Code Quality',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Schyler',
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 3.0),
                                  blurRadius: 3.0,
                                  color: Colors.black26,
                                ),
                              ],
                            ),
                          )),
                          SizedBox(height: 1,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
      crossAxisAlignment: CrossAxisAlignment.center, //Cente
                            children: [
                              InkWell(
                                onTap: lowquality,
                                child: Container(
                                  width: 130,
                                  child: Center(
                                    child: Text(
                                      'Average',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Schyler',
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(0.0, 3.0),
                                            blurRadius: 3.0,
                                            color: Colors.black26,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  height: 40,
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
                                ),
                              ),
                              SizedBox(width: 20,),
                              InkWell(
                                onTap: highquality,
                                child: Container(
                                  width: 130,
                                  child: Center(
                                    child: Text(
                                      'High',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Schyler',
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(0.0, 3.0),
                                            blurRadius: 3.0,
                                            color: Colors.black26,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  height: 40,
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
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            //first
            height: 75,
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
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
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
                                'QR Code Color',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Schyler',
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0.0, 3.0),
                                      blurRadius: 3.0,
                                      color: Colors.black26,
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(height: 1,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                            crossAxisAlignment: CrossAxisAlignment.center, //Cente
                            children: [
                              InkWell(
                                onTap: white,
                                child: Container(
                                  width: 130,
                                  child: Center(
                                    child: Text(
                                      'White',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Schyler',
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(0.0, 3.0),
                                            blurRadius: 3.0,
                                            color: Colors.black26,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  height: 40,
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
                                ),
                              ),
                              SizedBox(width: 20,),
                              InkWell(
                                onTap: grey,
                                child: Container(
                                  width: 130,
                                  child: Center(
                                    child: Text(
                                      'Grey',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Schyler',
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(0.0, 3.0),
                                            blurRadius: 3.0,
                                            color: Colors.black26,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  height: 40,
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
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
