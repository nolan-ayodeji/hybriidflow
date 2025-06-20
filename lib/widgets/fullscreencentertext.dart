import 'package:flutter/material.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'dart:async';
import 'package:hybriidflow/main.dart';

class fstext extends StatefulWidget {
  final text;
  final text2;
  final color;
  final color2;
  final textsize;
  final textsize2;
  final selectable;
  const fstext(
      {key,
      this.text,
      this.text2,
      this.color = Colors.black,
      this.color2 = Colors.black,
      this.textsize = 70,
      this.textsize2 = 23,
      this.selectable})
      : super(key: key);

  @override
  _fstextState createState() => _fstextState();
}

class _fstextState extends State<fstext> {
  double opacityLevel = 0;

  Future<void> playy() async {
    print('c');

    Future.delayed(const Duration(milliseconds: 1300), () {
      setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
    });

    print(opacityLevel);
  }

  void initState() {
    super.initState();
    playy();
  }

  @override
  Widget build(BuildContext context) {
    //The DelayedWidget will be used currently but I will soon create the slide from bottom animation myself
    return DelayedWidget(
      delayDuration: Duration(milliseconds: 200),
      animationDuration: Duration(seconds: 1),
      animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: Center(
                  child: SingleChildScrollView(
                    child: widget.selectable == true
                        ? SelectableText(
                            '${widget.text}',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: widget.color,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(0.0, 1.0),
                                    blurRadius: 6.0,
                                    color: Colors.black54,
                                  ),
                                ],
                                fontSize: widget.textsize,
                                fontFamily: 'Schyler'),
                          )
                        : Text(
                            '${widget.text}',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: widget.color,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(0.0, 1.0),
                                    blurRadius: 6.0,
                                    color: Colors.black54,
                                  ),
                                ],
                                fontSize: widget.textsize,
                                fontFamily: 'Schyler'),
                          ),
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: opacityLevel,
                duration: const Duration(milliseconds: 800),
                child: Center(
                  child: SingleChildScrollView(
                    child: Text(
                      '${widget.text2}',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: widget.color2,
                        fontSize: widget.textsize2,
                        fontFamily: 'Schyler',
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0.0, 1.0),
                            blurRadius: 6.0,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
