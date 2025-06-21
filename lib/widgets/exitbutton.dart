import 'package:flutter/material.dart';

class exitbutton extends StatefulWidget {
  @override
  _exitbuttonState createState() => _exitbuttonState();
}

class _exitbuttonState extends State<exitbutton> {
  @override
  Widget build(BuildContext context) {
    print("exitbuttonbuilt");
    return Container(
      width: 50,
      height: 50,
      child: Icon(Icons.close, color: Colors.black),
      decoration: BoxDecoration(
        color: Color(0xff808080),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white,
          width: 4,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Colors.white, Colors.white60],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset:
            Offset(0, 3), // changes position of shadow
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: -12.0,
            blurRadius: 12.0,
          ),
        ],
      ),
    );
  }
}
