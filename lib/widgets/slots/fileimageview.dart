import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
String image = 'https://static.vecteezy.com/system/resources/previews/001/308/900/non_2x/happy-family-with-son-vector.jpg';

class fimageviewer extends StatefulWidget {
  @override
  _fimageviewerState createState() => _fimageviewerState();
}

class _fimageviewerState extends State<fimageviewer> {
  Null objFile = null;
  var sd;
  var sdf;

  Future<void> pickimage() async {
    var sd = await FilePicker.platform.pickFiles();
    PlatformFile sdf = sd!.files.single;
    //blank print('WDW ${sdf}');

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: 340,
            height: 340,
            decoration: BoxDecoration(
              color: Color(0x46a3a3a3),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.memory(sd.bytes)
            )
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: pickimage ,
          child: Container(
            height: 40,

            decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Colors.white60, Colors.white],
              ),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: -12.0,
                  blurRadius: 12.0,
                ),
              ],
            ),
            width: 300,

          ),
        )
      ],

    );
  }
}
