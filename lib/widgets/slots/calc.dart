import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,

            children: [

              ButtonRow(),
              ButtonRow(),
              ButtonRow(),
              ButtonRow(),
              ButtonRow(),
            ],
          ),
        ),
      ],
    );
  }
}

class ButtonRow extends StatefulWidget {
  const ButtonRow({Key? key}) : super(key: key);

  @override
  State<ButtonRow> createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Button(),
        Button(),
        Button(),
        Button(),
      ],
    );
  }
}

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Expanded(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Color(0xFFB6B6B6),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                Color(0xFF808080),
                Color(0xFFB6B6B6),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
