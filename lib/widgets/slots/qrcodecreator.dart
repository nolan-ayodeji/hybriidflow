import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hybriidflow/providers/appmodel.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:html';

import '../../global/globvabs.dart';


class qr extends StatefulWidget {
  final url;
  final qual;
  final col;
  final set;
  final taptwo;
  final tapthree;
  final tapfour;
  final data;
  final tapfive;
  //final void Function(String) set2;

  const qr({
    this.url,
    this.set,
    this.taptwo,
    this.qual,
    this.col,
    this.tapthree,
    this.tapfour,
    this.data,
    this.tapfive,
  });
  @override
  _qrState createState() => _qrState();
}

class _qrState extends State<qr> {

  String data = 'hybriidflow';
  String quality = '230x230';
  String qrcolor = 'B9B9B9';
  String imgToShow = "hi";

  void imageSetters() {
    data = widget.data;
    quality = widget.qual;
    qrcolor = widget.col;
    imgToShow =
        "https://api.qrserver.com/v1/create-qr-code/?size=${widget.qual}&data=$data&bgcolor=$qrcolor";
    print("imgToShow: " + imgToShow);
  }

  Color backcolor = Color(0xFFB9B9B9);
  Color border = Colors.white;
  double borderrad = 2;
  double borderradius = 30;

  final fieldText = TextEditingController();

  void seturl() {
    print("seturl running");
    String sdata = widget.data;
    String squal = widget.qual;
    // setState(() {
    //   url =
    //       'https://api.qrserver.com/v1/create-qr-code/?size=$quality&data=$data&bgcolor=$qrcolor';
    // });

    // setState(() {
    //   widget.taptwo('https://api.qrserver.com/v1/create-qr-code/?size=$squal&data=$sdata&bgcolor=$qrcolor');
    // });
    //widget.set2('https://api.qrserver.com/v1/create-qr-code/?size=$quality&data=$data&bgcolor=$qrcolor');
  }

  void changeData() {}

  void highquality() {
    setState(() {
      quality = '1000x1000';
      widget.tapfour('1000x1000');
      imgToShow =
          "https://api.qrserver.com/v1/create-qr-code/?size=$quality&data=$data&bgcolor=$qrcolor";

      borderradius = 0;

      seturl();
    });

    print("tapping tow");
  }

  void lowquality() {
    setState(() {
      quality = '230x230';
      widget.tapfour('230x230');
      imgToShow =
          "https://api.qrserver.com/v1/create-qr-code/?size=$quality&data=$data&bgcolor=$qrcolor";

      borderradius = 0;

      borderradius = 30;
      seturl();
    });
  }

  void white() {
    setState(() {
      qrcolor = 'FFFFFF';
      backcolor = Colors.white;
      border = Colors.black;
      borderrad = 3;

      qrcolor = 'FFFFFF';
      widget.tapfive('FFFFFF');
      imgToShow =
          "https://api.qrserver.com/v1/create-qr-code/?size=$quality&data=$data&bgcolor=$qrcolor";

      borderradius = 0;

      seturl();
    });
    seturl();
  }

  void grey() {
    setState(() {
      qrcolor = 'B9B9B9';
      backcolor = Color(0xFFB9B9B9);
      border = Colors.white;
      borderrad = 2;

      qrcolor = 'B9B9B9';
      widget.tapfive('B9B9B9');
      imgToShow =
          "https://api.qrserver.com/v1/create-qr-code/?size=$quality&data=$data&bgcolor=$qrcolor";
    });
    seturl();
  }

  bool cc = true;
  bool cc2 = true;
  bool cc3 = true;
  bool cc4 = true;

  void setcc(PointerEvent details) {
    setState(() {
      cc = true;
    });
  }
  void setcc2(PointerEvent details) {
    setState(() {
      cc2 = true;
    });
  }
  void setcc3(PointerEvent details) {
    setState(() {
      cc3 = true;
    });
  }
  void unsetcc(PointerEvent details) {
    setState(() {
      cc = false;
    });
  }

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
  void unsetcc2(PointerEvent details) {
    setState(() {
      cc2 = false;
    });
  }
  void unsetcc3(PointerEvent details) {
    setState(() {
      cc3 = false;
    });
  }

  final yourScrollController = ScrollController();
  ScreenshotController urlcontroller = ScreenshotController();

  @override
  void initState() {
    fieldText.clear();
    imageSetters();
    imgToShow =
    "https://api.qrserver.com/v1/create-qr-code/?size=$quality&data=$data&bgcolor=$qrcolor";
    print("running imagetoshow");

    super.initState();

    // Clear text when widget is created
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final qrModel = Provider.of<QRModel>(context);
    final url = "https://api.qrserver.com/v1/create-qr-code/"
        "?size=${widget.qual}&data=${widget.data}&bgcolor=${widget.col}";
    print("builtyy");
    return Consumer<QRModel>(

      builder: (context, value, child) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(23),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              MouseRegion(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.easeInOutCirc,
                  width: 300,
                  height: 300,
                  child: Screenshot(
                      controller: urlcontroller,
                      child: Image.network(url)),

                  decoration: BoxDecoration(
                    color:
                    widget.col != "FFFFFF" ? Color(0xFFB9B9B9) : Colors.white,
                    borderRadius:
                    BorderRadius.circular(widget.qual == "230x230" ? 30 : 0),
                    border: Border.all(
                      color: widget.col == "FFFFFF" ? Colors.black : Colors.white,
                      width: borderrad,
                    ), //Color(0xFFB9B9B9)
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                //first
                height: 82,
                decoration: BoxDecoration(
                  color: Color(0xda191919),
                  borderRadius: BorderRadius.circular(35),
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
                            controller: fieldText,
                            onFieldSubmitted: (text) {
                              print("running tff with " + text);

                              setState(() {
                                data = text;
                                widget.tapthree(text);

                                imgToShow =
                                    "https://api.qrserver.com/v1/create-qr-code/?size=$quality&data=$data&bgcolor=$qrcolor";
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
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
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
                height: 79,
                decoration: BoxDecoration(
                  color: Color(0xda191919),
                  borderRadius: BorderRadius.circular(35),
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
                                'Code Quality',
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
                              SizedBox(
                                height: 1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, //Center Row contents horizontally,
                                crossAxisAlignment:
                                    CrossAxisAlignment.center, //Cente
                                children: [
                                  MouseRegion(
                                    onHover: setcc2,
                                    onExit: unsetcc2,
                                    child: InkWell(
                                      onTap: lowquality,
                                      child: AnimatedContainer(
                                        curve: Curves.easeInOutCirc,
                                        duration:
                                        Duration(milliseconds: issolid == true ? 0 : 290),
                                        width: cc2 != true ? 130 : 140,
                                        height: 40,
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
                                            colors: <Color>[
                                              Colors.white60,
                                              Color(0xDCFFFFFF)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  MouseRegion(
                                    onHover: setcc,
                                    onExit: unsetcc,
                                    child: InkWell(
                                      onTap: highquality,
                                      child: AnimatedContainer(
                                        curve: Curves.easeInOutCirc,
                                        duration:
                                        Duration(milliseconds: issolid == true ? 0 : 290),
                                        width: cc != true ? 130 : 140,
                                        height: 40,
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
                                            colors: <Color>[
                                              Colors.white60,
                                              Color(0xDCFFFFFF)
                                            ],
                                          ),
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
                height: 79,
                decoration: BoxDecoration(
                  color: Color(0xda191919),
                  borderRadius: BorderRadius.circular(35),
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
                                'Background Color',
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
                              SizedBox(
                                height: 1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, //Center Row contents horizontally,
                                crossAxisAlignment:
                                    CrossAxisAlignment.center, //Cente
                                children: [
                                  MouseRegion(

                                    child: InkWell(
                                      onTap: white,
                                      child: AnimatedContainer(
                                        curve: Curves.easeInOutCirc,
                                        duration:
                                        Duration(milliseconds: issolid == true ? 0 : 290),
                                        width: cc4 != true ? 130 : 140,
                                        height: 40,
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
                                            colors: <Color>[
                                              Colors.white60,
                                              Color(0xDCFFFFFF)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    onHover: setcc4,
                                    onExit: unsetcc4,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  MouseRegion(
                                    onHover: setcc3,
                                    onExit: unsetcc3,
                                    child: InkWell(
                                      onTap: lowquality,
                                      child: AnimatedContainer(
                                        curve: Curves.easeInOutCirc,
                                        duration:
                                        Duration(milliseconds: issolid == true ? 0 : 290),
                                        width: cc3 != true ? 130 : 140,
                                        height: 40,
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
                                          colors: <Color>[
                                            Colors.white60,
                                            Color(0xDCFFFFFF)
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  )],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap:  () async {
                  try {
                    // Capture the screenshot
                    final image =
                    await urlcontroller
                        .capture();

                    if (image != null) {
                      // Convert to base64 and create a downloadable link
                      final base64Image =
                      base64Encode(image);
                      final anchor =
                      AnchorElement(
                          href:
                          'data:application/octet-stream;base64,$base64Image')
                        ..download =
                            "flowQRCode.png" // Name of the downloaded file
                        ..target =
                            'blank';

                      // Append the anchor to the document and simulate a click
                      document.body!
                          .append(anchor);
                      anchor.click();
                      anchor
                          .remove(); // Clean up after the click
                    }
                  } catch (e) {
                    print(
                        "Error capturing or downloading the image: $e");
                  }
                },
                child: Center(
                  child: Container(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Icon(
                        Icons.save_alt_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xda191919),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[Colors.white60, Color(0xDCFFFFFF)],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
