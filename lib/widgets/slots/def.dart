import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:async/async.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:hybriidflow/pages/main.dart';

class dict extends StatefulWidget {
  final String finaldef;
  final String visible;
  final taptwo;
  const dict({key, required this.finaldef, this.taptwo, required this.visible}) : super(key: key);
  @override
  _dictState createState() => _dictState();
}

class _dictState extends State<dict> {
  String g = '';
  late List c;
  late List m;
  String definiton = 'lllllll';

  void getdata() async {

    Response response = await get(Uri.parse(
        'https://api.dictionaryapi.dev/api/v2/entries/en_US/' + definiton));
    List data = jsonDecode(response.body);
    List<dynamic> meanings = data[0]['meanings'];

    String definitions = '';
    for (var i = 0; i < meanings.length; i++) {
      List<dynamic> defs = meanings[i]['definitions'];
      definitions +=  '\n' +meanings[i]['partOfSpeech' ] + "s" + '\n';
      for (var j = 0; j < defs.length; j++) {
        String definition = defs[j]['definition'];
        definitions += (j + 1).toString() + '. ' + definition + '\n';
      }
    }

    setState(() {

      g = definitions;
      widget.taptwo(g);


    });
  }
  late List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),


    );

    this.setState(() {
      data = json.decode(response.body);
    });

    //blank print(data[1]["title"]);

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    getdata();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: getdata,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xda191919),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.white60, Color(0xDCFFFFFF)],
                ),
              ),
              height: 300,
              child: SingleChildScrollView(

                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(13),

                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Center(
                          child: SelectableText(
                            widget.visible,

                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                                fontSize: 15,
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
                      )
                    ),
                  ],
                ),
              ),

            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xda191919),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[Colors.white60, Color(0xDCFFFFFF)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textAlign: TextAlign.center,
                maxLength: 45,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  fontFamily: 'Schyler',

                ),
                scrollPhysics: NeverScrollableScrollPhysics(),
                cursorColor: Colors.black,
                onFieldSubmitted: (text) {
                  setState(() {
                    //blank print("g is" + g);
                    definiton = text;
                    getdata();

                  });
                },
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                    hintText:
                        'Type word here + press enter to search up definition',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      fontFamily: 'Schyler',

                    )),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: getdata,
            child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              children: [




              ],
            )),
          ),








        ],
      ),
    );
  }
}
