import 'package:flutter/material.dart';
import 'package:hybriidflow/widgets/topbar.dart';

import '../fullscreencentertext.dart';
import 'package:url_launcher/url_launcher.dart';

String _url = 'https://pub.dev/packages/url_launcher';

final List<String> entries = <String>[
  'https://www.youtube.com/',
  'https://www.google.com',
];

class quick extends StatefulWidget {
  final linkentries;

  const quick({super.key, this.linkentries});
  @override
  _quickState createState() => _quickState();
}

class _quickState extends State<quick> {
  void add(fix) {
    setState(() {
      widget.linkentries.add(fix);
    });
  }

  void remove(what) {
    setState(() {
      widget.linkentries.removeAt(what);
    });
  }

  void removelast() {
    setState(() {
      widget.linkentries.removeLast();
      currenterror = "QuickLinks: URL INVALID";
    });
    Future.delayed(Duration(seconds: 3), () {
      currenterror = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    //blank print(widget.linkentries);
    return Stack(
      children: [
        ListView.builder(
            key: UniqueKey(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.linkentries.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                key: UniqueKey(),
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      await canLaunch(widget.linkentries[index])
                          ? await launch(widget.linkentries[index])
                          : remove(index);
                    },
                    child: Container(
                      height: 50,
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
                      child: Stack(
                        children: [
                          Center(
                              child: FittedBox(
                                  child: Text(
                            widget.linkentries[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(0.0, 1.0),
                                    blurRadius: 3.0,
                                    color: Colors.black54,
                                  ),
                                ],
                                fontFamily: 'Schyler'),
                          ))),
                          Row(
                            children: [Expanded(child: Container()),
                            Container(width: 30,
                            color: Colors.red,)],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
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
                  child: TextFormField(
                    onFieldSubmitted: (text) async {
                      add(text);
                      await canLaunch(text) ? print('object') : removelast();
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
                      hintText:
                          "Type in a link, ex. https://www.google.com/gmail/about/#)",
                      fillColor: Colors.black,
                      focusColor: Colors.black,
                      hoverColor: Colors.black,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
    ;
  }
}
