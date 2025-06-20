import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:async/async.dart';
import 'dart:async';

import 'secret/privateinfo.dart';
bool isplaying = true;
class Last extends StatefulWidget {
  @override
  _LastState createState() => _LastState();
}

class _LastState extends State<Last> {
  String g = 'Retrieving Music';
  String image = 'https://hbflow.github.io/hbflowimages/wfm1.png';
  String user = 'foxxx000';
  late String Audio;
  late String Artist;
  late String Song ;
  bool verf = false;


  void getdata() async {
    Response response = await get(Uri.parse(
        'https://ws.audioscrobbler.com/2.0/?method=user.getRecentTracks&user=$user&limit=1&api_key=$thekey&format=json'));
    Map data = jsonDecode(response.body);
    //print(data);

    //print(song);

    if (data['recenttracks']["track"][0].containsKey('@attr')) {
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
        Audio = audio;
        Artist = name;
        Song = song;
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
        Audio = '   ';
        Artist = '   ';
        Song = '   ';
        isplaying = false;

      });

    // print(attr);
  }

  Future<void> repeat() async {
    await Future.delayed(Duration(seconds: 3), () {
      getdata();
    });
    print(image);

    repeat();
  }

  final ScrollController _firstController = ScrollController();

  @override
  void initState() {
    super.initState();
    getdata();
    repeat();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: RawScrollbar(
        thumbColor: Colors.black38,
        radius: Radius.circular(16),
        thickness: 7,
        controller: _firstController,
        thumbVisibility: true,

        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Stack(

                children: [
                  Center(

                    child: Visibility(
                      visible: verf == true ? true : false ,
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            SizedBox(height: 30,),


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
                              child:Container(

                                margin: const EdgeInsets.all(6.0),
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Color(0xffc7c7c7),
                                    width: 2,
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: <Color>[ Color(0xffa8a1a9),Color(0xffd8d6d8),],
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Text(""),
                                  Text('Music Info Will Appear Here'),
                                Text(''),
                                  ],
                                )
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                '${Song}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xffb4bde3),
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
                            SizedBox(
                              height: 5,
                            ),
                            Visibility(
                              visible: isplaying == true ? true : false,
                              child: FittedBox(
                                child: Text(
                                  'by',
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
                            ),
                            FittedBox(
                              child: Text(
                                '${Audio}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xffedf6e4),
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
                            Visibility(
                              visible: isplaying == true ? true : false,
                              child: FittedBox(
                                child: Text(
                                  'on',
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

                            ),
                            FittedBox(
                              child: Text(
                                '${Artist}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xffecdadd),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: verf == false ? true : false ,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Center(
                            child: Text(
                              'Enter Last.FM Username',
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
                          ),
                          SizedBox(height: 20,),
                          Container(

                            margin: const EdgeInsets.all(6.0),
                            padding: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Color(0xffc7c7c7),
                                width: 2,
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: <Color>[ Color(0xffa8a1a9),Color(0xffd8d6d8),],
                              ),
                            ),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              maxLength: 60,
                              onFieldSubmitted: (text) {
                                setState(() {
                                  user = text;
                                  verf = true;

                                });
                              },
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
                                ],
                              ),
                              scrollPhysics: NeverScrollableScrollPhysics(),
                              cursorColor: Colors.black,

                              decoration: InputDecoration(
                                hintText: "Enter Last.Fm Username",
                                fillColor: Colors.black,


                                focusColor: Colors.black,
                                hoverColor: Colors.black,
                                border: InputBorder.none,
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
        ),
      ),
    );
  }
}
