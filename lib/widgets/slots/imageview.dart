import 'package:flutter/material.dart';
import 'package:hybriidflow/pages/main.dart';
String image = 'https://static.vecteezy.com/system/resources/previews/001/308/900/non_2x/happy-family-with-son-vector.jpg';

class imageviewer extends StatefulWidget {
  @override
  _imageviewerState createState() => _imageviewerState();
}

class _imageviewerState extends State<imageviewer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                  minWidth: 800,
                  maxWidth: 800,
                    maxHeight: 600
                  ),
                  child: Container(


                    decoration: BoxDecoration(
                      color: Color(0x82A2A2A),
                      borderRadius: BorderRadius.circular(30),

                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(image),
                    )
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),


          ],

        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: <Color>[ Color(0xffa8a1a9),Color(0xffd8d6d8),],
                  ),
                ),

                child: TextFormField(
                  onFieldSubmitted: (text) {
                    setState(() {
                      image = text;

                    });
                  },
                  textAlign: TextAlign.center,
                  cursorColor: Colors.black,

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

                    ],),
                  decoration: InputDecoration(
                    hintText: "Enter Image Link",
                    fillColor: Colors.black,


                    focusColor: Colors.black,
                    hoverColor: Colors.black,
                    border: InputBorder.none,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
