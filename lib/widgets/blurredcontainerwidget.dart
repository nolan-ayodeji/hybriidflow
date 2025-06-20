import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BContainer extends StatelessWidget {
  final Widget child;

  const BContainer({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),

          child: ClipRRect(
            borderRadius: new BorderRadius.circular(30.0),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: 8.0,
                sigmaY: 8.0,
              ),
              child: Container(
                color: Colors.transparent,
                child: child,

              ),
            ),
          ),
        )
      ],
    );
  }
}
