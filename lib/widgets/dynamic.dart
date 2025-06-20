import 'package:flutter/material.dart';
import 'package:hybriidflow/global/globvabs.dart';

class DynamicContainer extends StatefulWidget {
  final milliseconds;
  final onHover;
  final Widget child;
  final onExit;
  final cc;
  final normwidth;
  final bigwidth;
  final normheight;
  final bigheight;
  final decoration;

  const DynamicContainer(
      {key,
      this.milliseconds,
      this.onHover,
      this.onExit,
      required this.child,
      this.cc,
      this.normwidth,
      this.bigwidth,
      this.normheight,
      this.bigheight,
      this.decoration})
      : super(key: key);

  @override
  _DynamicContainerState createState() => _DynamicContainerState();
}

class _DynamicContainerState extends State<DynamicContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: widget.cc == true ? widget.normwidth : widget.bigwidth,
      curve: Curves.easeInOutCirc,
      height: widget.cc == true ? widget.normheight : widget.bigheight,
      duration:
          Duration(milliseconds: issolid == true ? 0 : widget.milliseconds),
      child: widget.child,
    );
  }
}
