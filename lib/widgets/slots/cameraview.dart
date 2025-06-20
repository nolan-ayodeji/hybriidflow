import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:camera_web/camera_web.dart';

import 'package:flutter/foundation.dart';
import 'package:hybriidflow/pages/main.dart';
import 'package:hybriidflow/widgets/slots/imageview.dart';

class camera extends StatefulWidget {
  final wtd;

  const camera({Key? key, this.wtd}) : super(key: key);
  @override
  _cameraState createState() => _cameraState();
}

class _cameraState extends State<camera> {
  int _counter = 0;
  late CameraController controller;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final cameras = <CameraDescription>[];

  @override
  void initState() {
    super.initState();
    availableCameras().then((val) {
      cameras.addAll(val);
      controller = CameraController(cameras[0], ResolutionPreset.max);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Text(
                'Camera Access not accepted yet',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 40,
                  color: Color(0xffc7c7c7),
                  fontFamily: 'Schyler',
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.0, 3.0),
                      blurRadius: 3.0,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
              CameraPreview(controller)
            ]),
            Center(
              child: InkWell(
                onTap: (){entries.add(imageviewer());
                setState(() {
                  image = 'https://res.cloudinary.com/ireaderinokun/image/upload/v1632401120737/caniuse-embed/all/stream.png';
                });},
                child: Text(
                  'Camera Not Working? Press here to see supported browsers',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                    color: Color(0xff7fa7ff),
                    decoration: TextDecoration.underline,
                    fontFamily: 'Schyler',
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0.0, 3.0),
                        blurRadius: 3.0,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
