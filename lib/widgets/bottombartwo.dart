import 'package:flutter/material.dart';
import 'package:hybriidflow/global/globvabs.dart';
import 'package:hybriidflow/pages/main.dart';
import 'package:hybriidflow/pages/time.dart';
import 'package:hybriidflow/pages/unknown.dart';
import 'package:page_transition/page_transition.dart';

class bottom2bar extends StatefulWidget {
  final ftext;
  final action;
  final saction;

  const bottom2bar({key, this.ftext, this.action, this.saction})
      : super(key: key);
  @override
  _bottom2barState createState() => _bottom2barState();
}

class _bottom2barState extends State<bottom2bar> {
  Color top = Colors.grey.withOpacity(1);
  Color top2 = Colors.grey.withOpacity(0.5);
  bool cc = true;

  bool cc2 = true;
  bool cc3 = true;

  void white(PointerEvent details) {
    setState(() {
      top = Colors.grey.withOpacity(1);
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

  void white3(PointerEvent details) {
    setState(() {
      cc3 = false;
    });
  }

  void blue3(PointerEvent details) {
    setState(() {
      cc3 = true;
    });
  }
  void blue(PointerEvent details) {
    setState(() {
      top = Color(0xffdeffc4);
    });
  }

  void decidemusic() {
    if (shouldshowmusic == true)
      setState(() {
        shouldshowmusic = false;
        //blank print('made false');
      });
    else
      setState(() {
        shouldshowmusic = true;
        //blank print('made true');
      });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: anim,
      onExit: falseanim,
      child: Stack(
        children: [
          Column(
            children: [
              RepaintBoundary(
                child: Transform.scale(
                  scale: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MouseRegion(
                        onHover: white2,
                        onExit: blue2,
                        child: AnimatedContainer(
                          width: MediaQuery.of(context).size.width / 1.035,
                          height: isanythingopen == true
                              ? 45
                              : cc2 == true
                                  ? 45
                                  : 54,
                          duration:
                              Duration(milliseconds: issolid == true ? 0 : 300),
                          curve: Curves.easeInOutCirc,
                          child: Stack(
                            children: [
                              Center(
                                  child: Text(
                                widget.ftext,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 22,
                                  fontFamily: 'Schyler',
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0.0, 1.0),
                                      blurRadius: 3.0,
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                              )),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [Row(
                                  children: [InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade, child: timepage()));
                                    },
                                    child: InkWell(
                                      onTap: widget.action,
                                      child: MouseRegion(
                                        onHover: white3,
                                        onExit: blue3,

                                        child: AnimatedContainer(
                                            width: cc3 == true ? 100 : 120,
                                            height: isanythingopen == true
                                                ? 49
                                                : cc2 == true
                                                ? 49
                                                : 58,

                                            duration:
                                            Duration(milliseconds: issolid == true ? 0 : 200),
                                            curve: Curves.easeInOutCirc,

                                            decoration: BoxDecoration(

                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                bottomLeft: Radius.circular(22),
                                                topRight: Radius.circular(0),
                                                bottomRight: Radius.circular(0),

                                              ),
                                              color: cc3 == true ?  Color(
                                                  0x10000000) : Color(
                                                  0x10000000)
                                              ,



                                            ),
                                            child: Icon( on == true ? Icons.highlight_remove_rounded : Icons.add, color: Colors.black, size: 26)),
                                      ),
                                    ),
                                  ),],
                                ),
                                  Row(
                                    children: [InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType.fade, child: timepage()));
                                      },
                                      child: InkWell(
                                        onTap: widget.saction,
                                        child: MouseRegion(
                                          onHover: white3,
                                          onExit: blue3,

                                          child: AnimatedContainer(
                                              width: cc3 == true ? 100 : 120,
                                              height: isanythingopen == true
                                                  ? 49
                                                  : cc2 == true
                                                  ? 49
                                                  : 58,

                                              duration:
                                              Duration(milliseconds: issolid == true ? 0 : 200),
                                              curve: Curves.easeInOutCirc,

                                              decoration: BoxDecoration(

                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  bottomLeft: Radius.circular(0),
                                                  topRight: Radius.circular(22),
                                                  bottomRight: Radius.circular(22),

                                                ),
                                                color: cc3 == true ? Color(
                                                    0x10000000) : Color(
                                                    0x10000000)
                                                ,



                                              ),
                                              child: Icon( settingson == true ? Icons.highlight_remove_rounded : Icons.settings, color: Colors.black, size: 26)),
                                        ),
                                      ),
                                    ),],
                                  ),
                                ],
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
                    ],
                  ),
                ),
              ),
              Container(
                width: 30,
                height: 11,
              )
            ],
          ),
        ],
      ),
    );
  }
}
