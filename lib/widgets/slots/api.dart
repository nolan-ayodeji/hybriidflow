import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:async/async.dart';
import 'package:hybriidflow/providers/appmodel.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:hybriidflow/providers/widgetprovider.dart';

import '../../global/globvabs.dart';
import 'secret/privateinfo.dart';

bool isplaying = true;

class Last extends StatefulWidget {

  final bool hasuser;
  final String user;
  final taptwo;

  const Last({super.key, required this.hasuser, required this.user, this.taptwo});
  @override
  _LastState createState() => _LastState();
}

class _LastState extends State<Last> {
  String g = 'Retrieving Music';
  String image = 'https://hbflow.github.io/hbflowimages/wfm1.png';
  String user = "placeholder";
  late String Audio = "Waiting for music...";
  late String Artist = "";
  late String Song = "";
  bool verf = false;
  bool cc = true;
  String view = "new";
  bool mount = true;

  bool cc2 = true;
  void anim(PointerEvent details) {
    setState(() {
      cc = false;
    });
  }

  void falseanim(PointerEvent details) {
    setState(() {
      cc = true;
    });
  }

  bool cc3 = true;
  bool cc4 = true;
  bool cc5 = true;


  void anim3(PointerEvent details) {
    setState(() {
      cc3 = false;
    });
  }

  void falseanim3(PointerEvent details) {
    setState(() {
      cc3 = true;
    });
  }
  void anim4(PointerEvent details) {
    setState(() {
      cc4 = false;
    });
  }

  void falseanim4(PointerEvent details) {
    setState(() {
      cc4 = true;
    });
  }
  void anim5(PointerEvent details) {
    setState(() {
      cc5 = false;
    });
  }

  void falseanim5(PointerEvent details) {
    setState(() {
      cc5 = true;
    });
  }
  void getdata() async {
    user = widget.user;
    // print("GETTING DATA FOR " + user);

    
    Response response = await get(Uri.parse(
        'https://ws.audioscrobbler.com/2.0/?method=user.getRecentTracks&user=$user&limit=1&api_key=$thekey&format=json'));
    Map data = jsonDecode(response.body);
    //print(data);

    //print(song);

    if (!data.containsKey('recenttracks')){
      print("did not find key");
      setState(() {
        image = 'https://hbflow.github.io/hbflowimages/wfm1.png';
        Audio = "Waiting for music...";
        Artist = '   ';
        Song = '   ';
        isplaying = false;
      });
    } else if ( data['recenttracks']["track"].isNotEmpty && data['recenttracks']["track"][0].containsKey('@attr') ) {
      print('Found Song');

      String attr =
          data['recenttracks']["track"][0]["@attr"]["nowplaying"].toString();
      String audio =
          data['recenttracks']["track"][0]["artist"]['#text'].toString();

      //print(audio);

      String name =
          data['recenttracks']["track"][0]["album"]['#text'].toString();

      //print(name);

      String song = data['recenttracks']["track"][0]["name"].toString();
      String img =
          data['recenttracks']["track"][0]["image"][3]["#text"].toString();
      //print(img);
      setState(() {
        Audio = "• " +audio;
        Artist = name;
        Song =  song;
        isplaying = true;
      });
      if (img ==
          'https://lastfm.freetls.fastly.net/i/u/300x300/2a96cbd8b46e442fc41c2b86b821562f.png')
        setState(() {
          image = 'https://hbflow.github.io/hbflowimages/sorry.png';
        });
      else
        setState(() {
          image = img;
        });
    } else
      setState(() {
        image = 'https://hbflow.github.io/hbflowimages/wfm1.png';
        Audio = "Waiting for music...";
        Artist = '   ';
        Song = '   ';
        isplaying = false;
      });

    // print(attr);
  }

  Future<void> repeat() async {
    print("running repeat");
    await Future.delayed(Duration(milliseconds: 500), () {
      getdata();
    });
    print(image);

    if (mounted == true){
      repeat();
    } else {
      return;
    }
  }

  final ScrollController _firstController = ScrollController();

  @override
  void initState() {
    print("widget being rebullt");

    super.initState();

    getdata();
    repeat();
    user = widget.user;

  }

  @override
  void dispose() {



    super.dispose();
  }


  Widget build(BuildContext context) {
    return Consumer<FMModel>(

      builder: (context, value, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Stack(

            children: [

              Center(
                child: Container(
                  child: Stack(
                    children: [


                      Visibility(

                         visible: widget.hasuser == true ? true : false,
                        child: Container(
                          child: switch (value.view) {
                            "new" => Container(
                              color: Colors.black38,
                              height: 700,
                              child: Stack(
                                children: [
                                  Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Image.network(
                                          image,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  BackdropFilter(
                                    filter: ui.ImageFilter.blur(
                                      sigmaX: 8.0,
                                      sigmaY: 8.0,
                                    ),
                                    child: Container(

                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: <Color>[
                                            Color(0x80000000),
                                            Color(0xF21C1C1C),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              width: 340,
                                              height: 340,
                                              decoration: BoxDecoration(
                                                  color: Color(0x82A2A2A),

                                                  border: Border.all(color: Colors.white)),
                                              child: ClipRRect(

                                                child: OverflowBox(
                                                  child: FittedBox(
                                                    fit: BoxFit.cover,
                                                    alignment: Alignment.center,
                                                    child: Image.network(image),
                                                  ),
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: FittedBox(
                                                  child: Text(
                                                    '${Song}',
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
                                                        fontSize: 40,
                                                        fontFamily: 'Schyler'
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              FittedBox(
                                                child: Text(
                                                  '${Artist} ${Audio}',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w900,
                                                      color: Color(0xffffffff),
                                                      shadows: <Shadow>[
                                                        Shadow(//dun
                                                          offset: Offset(0.0, 3.0),
                                                          blurRadius: 5.0,
                                                          color: Colors.black54,
                                                        ),
                                                      ],
                                                      fontSize: 20,
                                                      fontFamily: 'Schyler'
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            "modern" => Container(
                              color: Colors.black38,
                              height: 700,
                              child: Stack(
                                children: [
                                  Opacity(

                                    opacity: 0.5,
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: Image.network(
                                            image,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  BackdropFilter(
                                    filter: ui.ImageFilter.blur(
                                      sigmaX: 8.0,
                                      sigmaY: 8.0,
                                    ),
                                    child: Container(

                                      // decoration: BoxDecoration(
                                      //   gradient: LinearGradient(
                                      //     begin: Alignment.topCenter,
                                      //     end: Alignment.bottomCenter,
                                      //     colors: <Color>[
                                      //       Color(0x80000000),
                                      //       Color(0xF21C1C1C),
                                      //
                                      //     ],
                                      //   ),
                                      // ),
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: FittedBox(
                                                  child: Text(
                                                    '${Song}',
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
                                                        fontSize: 40,
                                                        fontFamily: 'Schyler'
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              FittedBox(
                                                child: Text(
                                                  '${Artist} ${Audio}',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w900,
                                                      color: Color(0xffffffff),
                                                      shadows: <Shadow>[
                                                        Shadow(//dun
                                                          offset: Offset(0.0, 3.0),
                                                          blurRadius: 5.0,
                                                          color: Colors.black54,
                                                        ),
                                                      ],
                                                      fontSize: 20,
                                                      fontFamily: 'Schyler'
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          "old" => Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                    width: 340,
                                    height: 340,
                                    decoration: BoxDecoration(
                                        color: Color(0x82A2A2A),
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(color: Colors.white)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(7),
                                      child: OverflowBox(
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                          child: Image.network(image),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: FittedBox(
                                          child: Text(
                                            '${Song}',
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
                                                fontSize: 40,
                                                fontFamily: 'Schyler'),
                                          ),
                                        ),
                                      ),
                                      FittedBox(
                                        child: Text(
                                          '${Artist} ${Audio}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xffffffff),
                                            shadows: <Shadow>[
                                              Shadow(
                                                offset: Offset(0.0, 1.0),
                                                blurRadius: 3.0,
                                                color: Colors.black54,
                                              ),
                                            ],
                                            fontSize: 20,
                                              fontFamily: 'Schyler',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          _ => SizedBox()
                          },
                        ),
                      ),
                      Visibility(
                        visible: widget.hasuser == true ? false : true,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Enter Last.FM Username Below',
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
                                      fontSize: 20,
                                      fontFamily: 'Schyler'),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: const EdgeInsets.all(6.0),
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                    color: Color(0xffc7c7c7),
                                    width: 2,
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: <Color>[
                                      Color(0xffa8a1a9),
                                      Color(0xffd8d6d8),
                                    ],
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    maxLength: 60,
                                    onFieldSubmitted: (text) {
                                      setState(() {

                                        widget.taptwo(text);
                                        print("user from widget is" + widget.user);
                                        // verf = true;
                                      });
                                    },
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 10,
                                      fontFamily: 'Schyler',
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(0.0, 1.0),
                                          blurRadius: 2.0,
                                          color: Colors.black54,
                                        ),
                                      ],
                                    ),
                                    scrollPhysics: NeverScrollableScrollPhysics(),
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      hintText: "Enter Username Here",
                                      fillColor: Colors.black,
                                      focusColor: Colors.black,
                                      hoverColor: Colors.black,
                                      counterText: "",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 50,

                    child: Visibility(
                      visible: widget.hasuser == true ? true : false,
                      child: Row(children: [

                        Expanded(child: Container(),),
                        Text(
                          widget.user,
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
                              fontFamily: 'Schyler'),
                        ),
                        SizedBox(width: 10,),
                        Tooltip(
                          message: 'Minimalistic View',
                          height: 2.5,
                          decoration: BoxDecoration(
                            //colors
                            color: Color(0xDD383838),
                            borderRadius: BorderRadius.circular(38),
                            border: Border.all(
                              color: Colors.white60,
                              width: 1,
                            ),

                          ),
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 3.0),
                                  blurRadius: 3.0,
                                  color: Colors.black54,
                                ),
                              ],
                              fontFamily: 'Schyler'),
                          child: MouseRegion(
                            onHover: anim3,
                            onExit: falseanim3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: BackdropFilter(
                                filter: ui.ImageFilter.blur(
                                  sigmaX: 2.0,
                                  sigmaY: 2.0,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    value.setView("old");
                                  },
                                  child: AnimatedContainer(
                                    height: 35,
                                    width: cc3 ? 35 : 40,
                                    child: Center(
                                      child: Text(
                                        "1",
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
                                            fontFamily: 'Schyler'),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      //colors
                                      color: Color(0x61E0E0E0),

                                      borderRadius: BorderRadius.circular(35),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),

                                    ), duration: Duration(milliseconds: issolid == true ? 0 : 90),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Tooltip(
                          message: 'New View 1',
                          height: 2.5,
                          decoration: BoxDecoration(
                            //colors
                            color: Color(0xDD383838),
                            borderRadius: BorderRadius.circular(38),
                            border: Border.all(
                              color: Colors.white60,
                              width: 1,
                            ),

                          ),
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 3.0),
                                  blurRadius: 3.0,
                                  color: Colors.black54,
                                ),
                              ],
                              fontFamily: 'Schyler'),
                          child: MouseRegion(
                            onHover: anim4,
                            onExit: falseanim4,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: BackdropFilter(
                                filter: ui.ImageFilter.blur(
                                  sigmaX: 2.0,
                                  sigmaY: 2.0,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    value.setView("new");
                                  },
                                  child: AnimatedContainer(
                                    height: 35,
                                    width: cc4 ? 35 : 40,
                                    child: Center(
                                      child: Text(
                                        "2",
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
                                            fontFamily: 'Schyler'),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      //colors
                                      color: Color(0x61E0E0E0),

                                      borderRadius: BorderRadius.circular(35),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),

                                    ), duration: Duration(milliseconds: issolid == true ? 0 : 90),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Tooltip(
                          message: 'New View 2',
                          height: 2.5,
                          decoration: BoxDecoration(
                            //colors
                            color: Color(0xDD383838),
                            borderRadius: BorderRadius.circular(38),
                            border: Border.all(
                              color: Colors.white60,
                              width: 1,
                            ),

                          ),
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 3.0),
                                  blurRadius: 3.0,
                                  color: Colors.black54,
                                ),
                              ],
                              fontFamily: 'Schyler'),
                          child: MouseRegion(
                            onHover: anim5,
                            onExit: falseanim5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: BackdropFilter(
                                filter: ui.ImageFilter.blur(
                                  sigmaX: 2.0,
                                  sigmaY: 2.0,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    value.setView("modern");
                                  },
                                  child: AnimatedContainer(
                                    height: 35,
                                    width: cc5 ? 35 : 40,
                                    child: Center(
                                      child: Text(
                                        "3",
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
                                            fontFamily: 'Schyler'),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      //colors
                                      color: Color(0x61E0E0E0),

                                      borderRadius: BorderRadius.circular(35),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),

                                    ), duration: Duration(milliseconds: issolid == true ? 0 : 90),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                      ],),
                    ),
                  )


                ],
              ),
            ],
          ),
        );
      }
    );
  }
}
