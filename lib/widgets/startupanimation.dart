import 'package:flutter/material.dart';

class StartAnim extends StatefulWidget {
  final vis1;
  final vis2;

  const StartAnim({Key? key, this.vis1, this.vis2}) : super(key: key);
  @override
  _StartAnimState createState() => _StartAnimState();
}

class _StartAnimState extends State<StartAnim> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: widget.vis1,
        child: AnimatedOpacity(
          opacity: widget.vis2 ? 0.0 : 1.0,

          duration: const Duration(seconds: 1),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xa89c8e8e),
          ),
        ));
  }
}
