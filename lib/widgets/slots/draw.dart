import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';

class dwidget extends StatefulWidget {
  @override
  _dwidgetState createState() => _dwidgetState();
}

class _dwidgetState extends State<dwidget> {
  List<Offset> points = <Offset>[];

   var fs = {
  "name": "John Smith",
  "email": "john@example.com"
  };
   late String yocrunch;

  void getdata() async {


    //blank print(fs);
    String datetime = fs['name']!;
    setState(() {
      yocrunch = datetime;
    });



  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: getdata,
      child: Container(
        width: 200 ,
        height: 200,
        color: Colors.green,
        child: Text(yocrunch),
      ),
    );
  }
}

class Sketcher extends CustomPainter {
  final List<Offset> points;

  Sketcher(this.points);



  @override
  bool shouldRepaint(Sketcher oldDelegate) {
    return oldDelegate.points != points;
  }

  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }
}
