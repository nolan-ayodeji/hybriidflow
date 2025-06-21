
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hybriidflow/widgets/bottombar.dart';
import 'package:hybriidflow/widgets/fullscreencentertext.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:async';
import 'main.dart';
import 'package:intl/intl.dart';
import 'package:universal_io/io.dart';

class MyHomePage extends StatefulWidget {
  static const String route = '/average';




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool over = false;
  Color topColor = const Color(0xFF808080);
  TextEditingController _textFieldController = TextEditingController();

  final List<int> nums = <int>[];
  int fNum = 0;
  double average = 0;

  void goOver(PointerEvent details) {
    setState(() {
      over = true;
    });
  }

  void goDown(PointerEvent details) {
    setState(() {
      over = false;
    });
  }

  void avCalc() {
    fNum = 0;
    for (var i = 0; i < nums.length; i++) {
      fNum = fNum + nums[i];
      print(fNum);
    }
    print("fnum is" + fNum.toString());

    setState(() {
      average = fNum / nums.length;
    });
    print("average is" + average.toString());
    average = double.parse(average.toStringAsFixed(2));
  }

  bool over2 = false;

  void goOver2(TapDownDetails) {
    setState(() {
      over2 = true;
      topColor = const Color(0xCD6C6C6C);
    });
  }

  void goDown2(TapDownDetails) {
    setState(() {
      over2 = false;
      topColor = const Color(0xFF727272);

    });
  }

  void add(String toAdd) {
    setState(() {
      nums.add(int.parse(toAdd));
      avCalc();
    });
  }

  void addNum() {
    nums.add(int.parse(_textFieldController.text));
  }

  @override
  Widget build(BuildContext context) {
    print("aveagenumberbuilt");
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Stack(
        children: [
          hilly(),
          Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: FittedBox(
                  //makes the box keep shape
                  fit: BoxFit.contain,
                  alignment: Alignment.center,

                  child: MouseRegion(
                    onHover: goOver2,
                    onExit: goDown2,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOutCubicEmphasized,
                      width: MediaQuery.of(context).size.width / 1,
                      height: MediaQuery.of(context).size.height / 1,
                      decoration: BoxDecoration(
                        color: const Color(0xFFB6B6B6),
                        borderRadius:
                        BorderRadius.circular(over2 == true ? 45 : 38),
                        boxShadow:  [
                          BoxShadow(
                            color: over2 == true ? Color(0x613F3F3F) : Color(0x423F3F3F),
                            spreadRadius: 7,
                            blurRadius: 20,
                            offset:
                            Offset(0, 6),  // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black26,
                          width: over2 == true ? 1.9 : 1.6,
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: <Color>[
                            topColor,
                            const Color(0x1DB6B6B6),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Transform.scale(
                              scale: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, //Center Row contents horizontally,
                                crossAxisAlignment: CrossAxisAlignment
                                    .center, //Center Row contents vertically,
                                children: [
                                  Container(
                                    width: 90,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: over2 == true ? 1.9 : 1.6,
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: 80,
                                        height: 50,
                                        child: Center(
                                          child: TextFormField(
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontFamily: 'Schyler'
                                            ),
                                            keyboardType: TextInputType.number,
                                            controller: _textFieldController,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly
                                            ],
                                            decoration:
                                            const InputDecoration.collapsed(
                                              hintText: 'Enter #',
                                            ),
                                            onFieldSubmitted: (text) {
                                              setState(() {
                                                nums.add(int.parse(text));
                                                avCalc();
                                                _textFieldController.clear();
                                              });
                                            },
                                            cursorColor: Colors.black12,
                                            cursorHeight: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 100,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: over2 == true ? 1.9 : 1.6,
                                      ),
                                    ),
                                    child: Center(child: SelectableText(average.toString(), style: const TextStyle(
                                        fontFamily: 'Schyler'
                                    ))),
                                  )
                                ],
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(45),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 70,
                                  child: ListView.builder(
                                    // This next line does the trick.
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.all(8),

                                    itemCount: nums.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              nums.removeAt(index);
                                              avCalc();
                                            },
                                            child: Container(
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.black12,
                                                borderRadius:
                                                BorderRadius.circular(50),
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: over2 == true ? 1.3 : 0.9,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                    Color(0x51000000),
                                                    spreadRadius: 1,
                                                    blurRadius: 6,
                                                    offset: Offset(0,
                                                        2), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Center(

                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8),
                                                    child: SizedBox.expand(

                                                        child: FittedBox(
                                                            child: Text('${index + 1}' +
                                                                ": " +
                                                                nums[index]
                                                                    .toString(), style: const TextStyle(
                                                                fontFamily: 'Schyler'
                                                            ),))),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class hilly extends StatefulWidget {
  @override
  _hillyState createState() => _hillyState();
}

class _hillyState extends State<hilly> {
  @override
  Widget build(BuildContext context) {
    print("averagebackdropbuilt");
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: const OverflowBox(
        maxWidth: double.infinity,
        maxHeight: double.infinity,
        child: FittedBox(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          child: Image(image: AssetImage("assets/hbflowof-min.png")),
        ),
      ),
    );
  }
}
