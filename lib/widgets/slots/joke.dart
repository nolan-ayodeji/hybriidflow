import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:async/async.dart';
import 'dart:async';

import 'package:hybriidflow/global/globvabs.dart';
import 'package:hybriidflow/widgets/dynamic.dart';

class jokeapi extends StatefulWidget {
  @override
  _jokeapiState createState() => _jokeapiState();
}

class _jokeapiState extends State<jokeapi> {
  String begin = 'Thinking of a Joke....';
  String end = '';

  void getdata() async {
    Response response = await get(
        Uri.parse('https://v2.jokeapi.dev/joke/Any?safe-mode&type=twopart'));
    var tay = json.decode(response.body);

    //blank print(tay['setup']);
    //blank print(tay['delivery']);
    setState(() {
      begin = tay['setup'];
      end = tay['delivery'];
    });
  }

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
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 40,
          ),
          SelectableText(
            begin,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Color(0xffc7c7c7),
                fontSize: 30,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0.0, 1.0),
                    blurRadius: 3.0,
                    color: Colors.black54,
                  ),
                ],
                fontFamily: 'Schyler'),
          ),
          SizedBox(
            height: 25,
          ),
          Flexible(
            child: SelectableText(
              end,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Color(0xffc7c7c7),
                  fontSize: 30,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.0, 1.0),
                      blurRadius: 3.0,
                      color: Colors.black54,
                    ),
                  ],
                  fontFamily: 'Schyler'),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: getdata,
            child: Center(
              child: MouseRegion(
                onHover: anim,
                onExit: white,
                child: AnimatedContainer(
                  curve: Curves.easeInOutBack,
                  duration: Duration(milliseconds: issolid == true ? 0 : 250),
                  width: 300,
                  height: cc == true ? 50 : 60,

                  child: Row(
                    children: [
                      Flexible(
                          child: Center(
                              child: Text(
                        'New Joke',
                        style: TextStyle(fontFamily: 'Schyler'),
                      ))),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFB6B6B6),
                    borderRadius: BorderRadius.circular(40),
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
      ),
    );
  }
}
