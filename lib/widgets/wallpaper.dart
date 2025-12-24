import 'package:flutter/material.dart';
import 'package:hybriidflow/main.dart';
import 'package:hybriidflow/pages/main.dart';

class AddWallpaper extends StatefulWidget {
  @override
  _AddWallpaperState createState() => _AddWallpaperState();
}

class _AddWallpaperState extends State<AddWallpaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          hilly(),
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Color(0x434B4B4B)),
          Center(
            child: Container(
              height: 200.0,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() async {
                                    wp = 'assets/hbflowof-min.jpg';
                                    showwall = false;
                                    await new Future.delayed(const Duration(milliseconds: 50));
                                    Navigator.pop(context);

                                  });
                                },
                                child: Container(
                                  width: 400,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/hbflowof-min.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                    color: Color(0xda191919),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.3,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(0.0, 1.0),
                                        blurRadius: 3.0,
                                        color: Colors.black54,
                                      ),
                                    ],
                                    fontSize: 30,
                                    fontFamily: 'Schyler'),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() async {
                                    wp = 'assets/hilly2-min.png';
                                    showwall = false;
                                    await new Future.delayed(const Duration(milliseconds: 50));
                                    Navigator.pop(context);

                                  });
                                },
                                child: Container(
                                  width: 400,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/hilly2-min.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    color: Color(0xda191919),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.3,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(0.0, 1.0),
                                        blurRadius: 3.0,
                                        color: Colors.black54,
                                      ),
                                    ],
                                    fontSize: 30,
                                    fontFamily: 'Schyler'),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() async {
                                    wp = 'assets/gold.png';
                                    showwall = false;
                                    await new Future.delayed(const Duration(milliseconds: 50));
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  width: 400,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/gold.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    color: Color(0xda191919),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.3,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(0.0, 1.0),
                                        blurRadius: 3.0,
                                        color: Colors.black54,
                                      ),
                                    ],
                                    fontSize: 30,
                                    fontFamily: 'Schyler'),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Column(
                            children: [
                              Row(

                                children: [
                                  Container(
                                    width: 400,
                                    height: 200,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Solid Color',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset: Offset(0.0, 1.0),
                                                  blurRadius: 3.0,
                                                  color: Colors.black54,
                                                ),
                                              ],
                                              fontSize: 30,
                                              fontFamily: 'Schyler'),
                                        ),
                                        SizedBox(height: 30,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center ,//Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() async {

                                                  wp = 'assets/grey.png';
                                                  await new Future.delayed(const Duration(milliseconds: 50));
                                                  showwall = false;
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: Container(width: 40, height: 40, decoration: BoxDecoration(

                                                color: Color(0xda5a5a5a),
                                                borderRadius: BorderRadius.circular(30),
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 1.3,
                                                ),
                                              ),),
                                            ),
                                            SizedBox(width: 30,),
                                            InkWell(
                                              onTap: () {
                                                setState(() async {

                                                  wp = 'assets/lightgrey.png';
                                                  await new Future.delayed(const Duration(milliseconds: 50));
                                                  showwall = false;
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: Container(width: 40, height: 40, decoration: BoxDecoration(

                                                color: Color(0xfacecece),
                                                borderRadius: BorderRadius.circular(30),
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 1.3,
                                                ),
                                              ),),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/grey.png'),
                                        fit: BoxFit.cover,
                                      ),
                                      color: Color(0xda191919),
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(0.0, 1.0),
                                        blurRadius: 3.0,
                                        color: Colors.black54,
                                      ),
                                    ],
                                    fontSize: 30,
                                    fontFamily: 'Schyler'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
