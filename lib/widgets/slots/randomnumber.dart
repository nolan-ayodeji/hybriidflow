import 'package:flutter/material.dart';
import 'package:hybriidflow/global/globvabs.dart';
import 'package:hybriidflow/widgets/slots/counter.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../providers/appmodel.dart';
import '../fullscreencentertext.dart';
import 'package:delayed_widget/delayed_widget.dart';

class CounterProvider2 extends ChangeNotifier {
  int _counterValue = 60;
  int _random = 60;

  int get value => _counterValue;
  int get ran => _random;

  void increment() {
    _counterValue--;
    notifyListeners();
    //blank print(_counterValue);
  }

  void decrement() {
    _counterValue--;
    notifyListeners();
  }
}

class randomnum extends StatefulWidget {
  final CounterProvider2 widprovide;
  final int num;
  final int max;
  final int min;
  final tapone;
  final taptwo;
  final tapthree;

  const randomnum(
      {Key? key,
      required this.widprovide,
      required this.num,
      required this.max,
      this.tapone,
      this.taptwo, required this.min, this.tapthree})
      : super(key: key);
  @override
  _randomnumState createState() => _randomnumState();
}

class _randomnumState extends State<randomnum> {
  int minimum = 1;
  int maximum = 100;
  int randomNumber = 0;




  addmin() {
    setState(() {
      minimum++;
    });
  }

  submin() {
    setState(() {
      minimum--;
    });
  }

  addmax() {
    setState(() {
      maximum++;
    });
  }

  submax() {
    setState(() {
      maximum--;
    });
  }

  makerandom() {
    setState(() {
      Random random = new Random();
      widget.widprovide._random = random.nextInt(maximum) + minimum;
      //blank print(widget.widprovide._random);
    });
  }

  bool cc = true;
  bool cc2 = true;
  bool cc3 = true;
  bool cc4 = true;
  bool cc5 = true;

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

  void white2(PointerEvent details) {
    setState(() {
      cc2 = true;
    });
  }

  void anim2(PointerEvent details) {
    setState(() {
      cc2 = false;
    });
  }

  void white3(PointerEvent details) {
    setState(() {
      cc3 = true;
    });
  }

  void anim3(PointerEvent details) {
    setState(() {
      cc3 = false;
    });
  }

  void white4(PointerEvent details) {
    setState(() {
      cc4 = true;
    });
  }

  void anim4(PointerEvent details) {
    setState(() {
      cc4 = false;
    });
  }

  void white5(PointerEvent details) {
    setState(() {
      cc5 = true;
    });
  }

  void anim5(PointerEvent details) {
    setState(() {
      cc5 = false;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.widprovide._random = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: MouseRegion(
            onHover: anim,
            onExit: white,
            child: AnimatedContainer(
              curve: Curves.easeInOutCirc,
              duration: Duration(milliseconds: issolid == true ? 0 : 260),
              width: cc == true ? 300 : 310,
              height: cc == true ? 300 : 310,
              child: DelayedWidget(
                delayDuration: Duration(milliseconds: 200),
                animationDuration: Duration(seconds: 1),
                animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                child: Center(
                  child: SelectableText(
                    '${widget.num}',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      fontSize: 110,
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
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Set Values Below',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0.0, 1.0),
                  blurRadius: 3.0,
                  color: Colors.black54,
                ),
              ],
              fontSize: 15,
              fontFamily: 'Schyler'),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Minimum',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white70,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0.0, 1.0),
                  blurRadius: 3.0,
                  color: Colors.black54,
                ),
              ],
              fontSize: 15,
              fontFamily: 'Schyler'),
        ),
        SizedBox(
          height: 0,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: Container()),
              Expanded(
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Schyler'),
                    initialValue: "0",
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (text) async {
                      //blank print(int.parse(text).toString());
                      widget.tapthree(text);
                    },
                  ),
                ),
              ),
              Expanded(child: Container())
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Maximum',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white70,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0.0, 1.0),
                  blurRadius: 3.0,
                  color: Colors.black54,
                ),
              ],
              fontSize: 15,
              fontFamily: 'Schyler'),
        ),
        SizedBox(
          height: 0,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: Container()),
              Expanded(
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(color: Colors.white, fontFamily: 'Schyler'),
                    initialValue: "100",
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (text) async {
                      //blank print(int.parse(text).toString());
                      widget.taptwo(text);
                    },
                  ),
                ),
              ),
              Expanded(child: Container())
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: (){
            setState(() {
              widget.tapone?.call();
            });
    },
          child: Center(
            child: MouseRegion(
                onHover: anim5,
                onExit: white5,
                child: AnimatedContainer(
                  curve: Curves.easeInOutCirc,
                  duration: Duration(milliseconds: issolid == true ? 0 : 260),
                  width: cc5 == true ? 200 : 205,
                  height: cc5 == true ? 50 : 60,
                  child: Center(
                      child: Text(
                    'Pick Number',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0.0, 1.0),
                            blurRadius: 3.0,
                            color: Colors.black54,
                          ),
                        ],
                        fontFamily: 'Schyler'),
                  )),
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
                )),
          ),
        )
      ],
    );
  }
}
