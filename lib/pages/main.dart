import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hybriidflow/providers/appmodel.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:hybriidflow/global/globvabs.dart';
import 'package:hybriidflow/providers/widgetprovider.dart';
import 'package:hybriidflow/widgets/bottombar.dart';
import 'package:hybriidflow/widgets/bottombartwo.dart';
import 'package:hybriidflow/widgets/exitbutton.dart';
import 'package:hybriidflow/widgets/fullscreencentertext.dart';
import 'package:hybriidflow/widgets/infowidget.dart';
import 'package:hybriidflow/widgets/settingslist.dart';
import 'package:hybriidflow/widgets/slots/analogclock.dart';
import 'package:hybriidflow/widgets/slots/api.dart';
import 'package:hybriidflow/widgets/slots/battery.dart';
import 'package:hybriidflow/widgets/slots/calc.dart';
import 'package:hybriidflow/widgets/slots/cameraview.dart';
import 'package:hybriidflow/widgets/slots/chatgptt.dart';
import 'package:hybriidflow/widgets/slots/counter.dart';
import 'package:hybriidflow/widgets/slots/def.dart';
import 'package:hybriidflow/widgets/slots/draw.dart';
import 'package:hybriidflow/widgets/slots/fileimageview.dart';
import 'package:hybriidflow/widgets/slots/googletransalate.dart';
import 'package:hybriidflow/widgets/slots/imageview.dart';
import 'package:hybriidflow/widgets/slots/joke.dart';
import 'package:hybriidflow/widgets/slots/livedate.dart';
import 'package:hybriidflow/widgets/slots/livetime.dart';
import 'package:hybriidflow/widgets/slots/platform.dart';
import 'package:hybriidflow/widgets/slots/qrcodecreator.dart';
import 'package:hybriidflow/widgets/slots/quicklinks.dart';
import 'package:hybriidflow/widgets/slots/randomnumber.dart';
import 'package:hybriidflow/widgets/slots/timeanddate.dart';
import 'package:hybriidflow/widgets/slots/worldclock.dart';
import 'package:hybriidflow/widgets/startupanimation.dart';
import 'package:hybriidflow/widgets/topbar.dart';
import 'package:hybriidflow/widgets/wallpaper.dart';
import 'package:hybriidflow/widgets/warning.dart';
import 'package:intl/intl.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:provider/provider.dart';
import 'package:universal_io/io.dart';
import 'package:hybriidflow/widgets/wsstate.dart';

import 'dart:html' show IFrameElement;
// Import package
import 'package:battery_plus/battery_plus.dart';

import 'dart:math' as math;

import 'dart:ui' as ui;

import '../widgets/bottombarthree.dart';
import '../widgets/slots/desmos.dart';
import '../widgets/slots/intmap.dart';

bool gradientan = false;
int widgetsort = 1;
String sortname = "Category Name";
bool bool_bar = false;

bool isanythingopen = false;
bool shouldshowmusic = false;
bool bigsettings = false;
bool settingson = false;
bool on = false;
bool showwall = false;

String registerEmail = "";
String registerUser = "";
String registerPassword = "";
bool regerror = false;
String signEmail = "";
String signUser = "";
String signPassword = "";

Future<UserCredential?> registerWithEmailPassword(
    String email, String password, String disName) async {
  print(email);
  UserCredential flowuser =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  User? user = flowuser.user;
  user?.updateProfile(displayName: disName);

  return flowuser;
}

Future<UserCredential?> loginwemailandpassword(
  String email,
  String password,
) async {
  print(email);
  UserCredential flowuser =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );



  return flowuser;
}

String wp = 'assets/hbflowof-min.jpg';

class WidgetSlotContainer {
  WidgetSlotContainer(this.name, this.isgrey, this.categories, this.color,
      this.key, this.widget2);

  final String name;

  final WidgetEntry widget2;
  final bool isgrey;
  final String categories;
  final Color color;
  final Key? key;
}

class mainpage extends StatefulWidget {
  static const String route = '/flow';
  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  List<Color> colorList = [
    Color(0xff242424),
    Color(0xff1f2021),
    Color(0xff404040),
    Colors.grey,
  ];

  final _controller = ScrollController();
  final _cr = ScrollController();
  final List<int> colorCodes = <int>[600, 500, 100];
  final _height = 100.0;
  DateTime now = DateTime.now();
  String dynamic_s = 's';
  String graphictf = 'Low';
  String anim = 'Off';

  bool _visible = false;
  bool startupvis = true;
  int index = 0;

  bool shouldscroll = false;
  String scrollable = 'Off';
  Color bottomColor = Color(0xff2a2a2a);
  Color topColor = Color(0xff2a2a2a);

  String gradtotext = 'Off';
  String solid = 'On';
  String solid2 = 'Off';
  String warning = 'On';
  bool dockl = false;
  bool showwarning = true;
  bool anywidgets = true;
  bool cc3 = true;

  bool random = false;

  bool tempsetting = false;

  int randomNumber = 0;
  bool smoothergraphics = false;

  void switchsort() {
    //blank print('starting');
    if (widgetsort == 1)
      setState(() {
        widgetsort = 2;
        //blank print(widgetsort);
      });
    else
      setState(() {
        widgetsort = 1;
      });
  }

  int randomNumber2 = 0;
  // void pickrandomwidget() {
  //   print(
  //     "pcking"
  //   );
  //   setState(() {
  //     Random random = new Random();
  //     randomNumber2 = random.nextInt(widgetstoadd.length);
  //     print(randomNumber2);
  //   });
  //   if (widgetstoadd[randomNumber2].name == "Mirror (Beta)")
  //     pickrandomwidget(); //Used to Avoid Camera Widget
  //
  //   else {
  //     print("adding");
  //     print((widgetstoadd[randomNumber2].name));
  //
  //     entries2.add(widgetstoadd[randomNumber2].widget2);
  //     opened = false;
  //   }
  //
  // }

  void dyn() {
    if (entries.length == 1)
      setState(() {
        dynamic_s = '${entries.length} widget';
        checkifwidgetsexist();
      });
    else
      setState(() {
        dynamic_s = '${entries.length} widgets';
        checkifwidgetsexist();
      });
  }

  void white3(PointerEvent details) {
    setState(() {
      cc3 = true;
    });
  }

  void printEntries(List<WidgetEntry> entries) {
    for (var entry in entries) {
      print('Type: ${entry.type}');
      print('Content:');
      entry.content.forEach((key, value) {
        print('  $key: $value');
      });
      print(''); // Blank line between entries
    }
  }

  void anim3(PointerEvent details) {
    setState(() {
      cc3 = false;
    });
  }

  void ifcontain() {
    //blank print(entries);
    //blank print(entries.contains(jokeapi()));
    if (entries.any((item) => item is Last == true)) {
      //blank print('CHILE');
      entries.removeLast();
    }
  }

  bool wann = true;

  void wanim() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        wann = false;
      });
    });
  }

  void scroll(ani) {
    _controller.animateTo(ani,
        duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
  }

// This is what you're looking for!
  void _scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  void checkifwidgetsexist() {
    if (entries.length == 0)
      setState(() {
        anywidgets = true;
      });
    else
      setState(() {
        anywidgets = false;
      });
  }

  void _onReorder(int oldindex, int newindex) {
    setState(() {
      if (oldindex < newindex) {
        newindex -= 1;
      }
      final Widget item = entries.removeAt(oldindex);
      entries.insert(newindex, item);
    });
  }

  Future<void> ofenonight() async {
    //blank print(await battery.batteryLevel);
  }

  void changegraphics() {
    if (smoothergraphics == true)
      setState(() {
        smoothergraphics = false;
        graphictf = 'Low';
      });
    else
      setState(() {
        smoothergraphics = true;
        graphictf = 'High';
      });
  }

  void bigsetting() {
    if (bigsettings == true)
      setState(() {
        bigsettings = false;
      });
    else
      setState(() {
        bigsettings = true;
      });
  }

  Future<void> startup() async {
    await Future.delayed(Duration(milliseconds: 1), () {
      setState(() {
        _visible = !_visible;
      });
    });
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        startupvis = false;
      });
    });
  }

  void changesolid() {
    if (issolid == true)
      setState(() {
        issolid = false;
        solid = 'On';
        //blank print('border');
      });
    else
      setState(() {
        issolid = true;
        solid = 'Off';
        //blank print('border');
      });
  }

  bool docks = true;
  String dstyle = "New";

  void dockstyle() {
    if (bool_bar == true)
      setState(() {
        bool_bar = false;
        dstyle = 'New';
        //blank print('border');
      });
    else
      setState(() {
        bool_bar = true;
        dstyle = 'Classic';
        //blank print('border');
      });
  }

  void dockshow() {
    if (dockl == true)
      setState(() {
        dockl = false;
        solid2 = 'Off';
        //blank print('border');
      });
    else
      setState(() {
        dockl = true;
        solid2 = 'On';
        //blank print('border');
      });
  }

  void warningshow() {
    if (showwarning == true)
      setState(() {
        showwarning = false;
        warning = 'Off';
        //blank print('border');
      });
    else
      setState(() {
        showwarning = true;
        warning = 'On';
        //blank print('border');
      });
  }

  String israndom = 'Off';
  void randomshow() {
    if (random == true)
      setState(() {
        random = false;
        israndom = 'Off';

        //blank print('border');
      });
    else
      setState(() {
        random = true;
        israndom = 'On';

        //blank print('border');
      });
  }

  String isborder = 'On';
  String isbattery = 'Off';
  void bordershow() {
    if (border == true)
      setState(() {
        border = false;
        isborder = 'Off';

        //blank print('border');
      });
    else
      setState(() {
        border = true;
        isborder = 'On';

        //blank print('border');
      });
  }

  bool battery0 = false;
  void battery_() {
    if (battery0 == true)
      setState(() {
        battery0 = false;
        isbattery = 'Off';

        //blank print('battery');
      });
    else
      setState(() {
        battery0 = true;
        isbattery = 'On';

        //blank print('battery');
      });
  }

  void changescroll() {
    if (shouldscroll == true)
      setState(() {
        shouldscroll = false;
        scrollable = 'Off';
        //blank print('TURNEDOFF');
      });
    else
      setState(() {
        shouldscroll = true;
        scrollable = 'On';
      });
  }

  void changeanimtoonoff() {
    if (gradientan == true)
      setState(() {
        gradtotext = 'On';
      });
    else
      setState(() {
        gradtotext = 'Off';
      });
  }

  bool logerror = false;
  void temp() {
    //blank print("rebuilding");

    print("logtrue");
    setState(() {
      logerror = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        logerror = false;
      });
      print("logfalse;");
    });
  }

  void changeganim() {
    if (gradientan == true)
      setState(() {
        gradientan = false;
        anim = 'Off';
      });
    else
      setState(() {
        gradientan = true;
        anim = 'On';
      });
  }

  void addmenu() {
    if (on == true)
      setState(() {
        on = false;
        opened = false;
        printEntries(entries2);

        dyn();
        isanythingopen = false;
        //blank print(smoothergraphics);
      });
    else
      setState(() {
        on = true;
        settingson = false;
        anywidgets = false;
        opened = true;

        isanythingopen = true;
        //blank print(smoothergraphics);
        dyn;
      });
  }

  void settingmenu() {
    if (settingson == true)
      setState(() {
        settingson = false;
        dyn();
        isanythingopen = false;
        opened = false;
      });
    else
      setState(() {
        settingson = true;
        on = false;
        dyn;
        anywidgets = false;
        isanythingopen = true;
        opened = true;
      });
  }

  void colorchange() {
    setState(() {
      bottomColor = Colors.blue;
    });
  }

  void gettime() {
    // setState(() {
    //   //blank print("callinggs");
    //   now = DateTime.now();
    // });
    //
    // Future.delayed(Duration(seconds:1), () {
    //   gettime();
    // });
  }

  void love(crazy) {
    //blank print(crazy);
  }

  void add() {
    setState(() {
      entries.add(imageviewer());
    });
    dyn();
    //blank print(dynamic_s);
  }

  void delete() {
    setState(() {
      entries.removeLast();
    });
    dyn();
    //blank print(dynamic_s);
  }

  void remove(at) {
    if (this.mounted) {
      setState(() {
        entries.removeAt(at);
      });
    }
  }

  void settingtemp(tempo) {
    if (tempo == true)
      setState(() {
        tempsetting = true;
        print('TEMPSETTING');
      });
    else
      setState(() {
        tempsetting = false;
        print('TEMPSETTING');
      });
  }

  var battery = Battery();
  int percentage = 0;

  @override

  // method created to display battery percent
  void getBatteryPerentage() async {
    final level = await battery.batteryLevel;
    percentage = level;

    setState(() {});
    Future.delayed(Duration(seconds: 10), () {
      getBatteryPerentage();
    });
  }

  bool cc7 = true;

  void anim7(PointerEvent details) {
    setState(() {
      cc7 = false;
    });
  }

  void falseanim7(PointerEvent details) {
    setState(() {
      cc7 = true;
    });
  }

  void initState() {
    super.initState();
    //
    gettime();
    dyn();
    startup();
    wanim();
    getBatteryPerentage();
    // ignore: undefined_prefixed_name
  }

  @override
  Widget build(BuildContext context) {
    //print("mainpage2built");
    return RepaintBoundary(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Stack(
              children: [
                hilly(),
                //Backdrop
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: smoothergraphics == false
                      ? Color(0x434B4B4B)
                      : Color(0x9A9A9A),
                ), //Backdrop brightness
                Center(
                  child: Column(
                    children: [
                      topbar(
                        action2: () {
                          setState(() {});
                        },
                      ),
                      Consumer<AppModel>(builder: (context, value, child) {
                        return Container(
                          height: value.size,
                        );
                      }), //The Top Bar
                      Expanded(
                        child: Stack(
                          children: [
                            ScrollConfiguration(
                              behavior:
                                  ScrollConfiguration.of(context).copyWith(
                                dragDevices: {
                                  PointerDeviceKind.touch,
                                  PointerDeviceKind.mouse,
                                },
                              ),
                              child: ListView.builder(
                                itemCount: entries2.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  String widget = entries2[index].type;
                                  Map<String, dynamic> content =
                                      entries2[index].content;

                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FittedBox(
                                      child: Column(
                                        children: [
                                          infowidget(
                                            what: () {
                                              setState(() {
                                                entries2.removeAt(index);
                                              });
                                            },
                                            slot: switch (widget) {
                                              "counter" => counter(
                                                  widprovide: CounterProvider(),
                                                  num: content["number"]
                                                      .toString(),
                                                  tapuno: () {
                                                    setState(() {
                                                      content["number"]++;
                                                    });
                                                  },
                                                  tapdos: () {
                                                    setState(() {
                                                      content["number"]--;
                                                    });
                                                  },
                                                ),
                                              "dict" => dict(
                                                  finaldef: "",
                                                  visible: content["def"],
                                                  taptwo: (String value) {
                                                    setState(() {
                                                      content["def"] = value;
                                                      print("value is" +
                                                          value.toString());
                                                    });

                                                    // your logic here
                                                  },
                                                ),
                                              "qls" => quick(
                                                  linkentries: content["links"],
                                                ),
                                              "ran" => randomnum(
                                                  widprovide:
                                                      CounterProvider2(),
                                                  num: content["number"],
                                                  min: content["min"],
                                                  max: content["max"],
                                                  tapone: () {
                                                    setState(() {
                                                      // content["number"]++;
                                                      Random random =
                                                          new Random();
                                                      content["number"] = random
                                                              .nextInt(content[
                                                                      "max"] -
                                                                  content[
                                                                      "min"] +
                                                                  1) +
                                                          content["min"];
                                                    });
                                                  },
                                                  taptwo: (String value) {
                                                    print("Tapped with $value");
                                                    content["max"] =
                                                        int.parse(value);
                                                    // your logic here
                                                  },
                                                  tapthree: (String value) {
                                                    print("Tapped with $value");
                                                    content["min"] =
                                                        int.parse(value);
                                                    // your logic here
                                                  },
                                                ),
                                              "img" => imageviewer(),
                                              "qr" => qr(
                                                  taptwo: (String value) {
                                                    setState(() {
                                                      content["urlskii"] =
                                                          value;
                                                    });

                                                    print(value);
                                                  },
                                                  tapthree: (String value) {
                                                    setState(() {
                                                      print("3 tapped");
                                                      content["urlskii2"] =
                                                          value;
                                                    });

                                                    print(value);
                                                  },
                                                  tapfour: (String value) {
                                                    setState(() {
                                                      content["quality"] =
                                                          value;
                                                    });

                                                    print(value);
                                                  },
                                                  url: content["urlskii"],
                                                  qual: content["quality"],
                                                  col: content["color"],
                                                  data: content["urlskii2"],
                                                  tapfive: (String value) {
                                                    setState(() {
                                                      content["color"] = value;
                                                    });

                                                    print(entries2);
                                                  },
                                                ),
                                              "last" => Last(
                                                  hasuser: content["userin"],
                                                  user: content["username"],
                                                  taptwo: (String value) {
                                                    setState(() {
                                                      print(
                                                          "Tapped with $value");
                                                      content["username"] =
                                                          value;
                                                      print(content);
                                                      content["userin"] = true;
                                                    });

                                                    // your logic here
                                                  },
                                                ),
                                              "td" => timeanddate(),
                                              "analog" => Analog(),
                                              "t" => time(),
                                              "world" => des(),
                                              "date" => date(),
                                              "plat" => plat(),
                                              "joke" => jokeapi(),
                                              "mirror" => camera(),
                                              "translate" => ggt(),
                                              "wrldmap" => WorldMap(),
                                              "battery" => bat(),
                                              _ => SizedBox(),
                                            },
                                            sshow: tempsetting,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      Consumer<AppModel>(builder: (context, value, child) {
                        return Container(
                          height: value.size,
                        );
                      }), //The main part of this whole webapp: The widgets

                      SizedBox(
                        height: 5,
                      ),
                      warning1(
                        visible1: opened
                            ? false
                            : entries2.isEmpty
                                ? true
                                : false,
                        visible2: showwarning,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        child: bool_bar == true
                            ? bottombar(
                                ftext: dockl == false
                                    ? '${DateFormat('h:mm').format(now)} • ${Platform.operatingSystem} ${battery0 == true ? "• ${percentage}%" : ""} '
                                    : '${DateFormat('h:mm').format(now)} • ${Platform.operatingSystem} • ${entries.length} ${battery0 == true ? "• ${percentage}%" : ""}',
                                action: () {
                                  addmenu();
                                },
                                saction: () {
                                  settingmenu();
                                  colorchange();
                                },
                              )
                            : Consumer<AppModel>(
                                builder: (context, app, child) {
                                return bottom3bar(
                                  ftext: dockl == false
                                      ? '${DateFormat('h:mm').format(app.now)} • ${Platform.operatingSystem} ${battery0 == true ? "• ${percentage}%" : ""}'
                                      : '${DateFormat('h:mm').format(app.now)} • ${Platform.operatingSystem} • ${entries.length} ${battery0 == true ? "• ${percentage}%" : ""}',
                                  action: () {
                                    addmenu();
                                  },
                                  saction: () {
                                    settingmenu();
                                    colorchange();
                                  },
                                );
                              }),
                        //onTap: entries.length < 1 ? add : delete,
                      ) //The Bottom bar
                    ],
                  ),
                ), //Main Components of Screen: Top Bar, Widgets, and Bottom Bar
              ],
            ),
            Visibility(
                visible: startupvis,
                child: AnimatedOpacity(
                  opacity: _visible ? 0.0 : 1.0,
                  duration: const Duration(seconds: 1),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Color(0xff808080),
                  ),
                )),
            Column(
              //WIDGET
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  //widgetadd
                  visible: on,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Widgets",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 25,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 3.0,
                                  color: Colors.black54,
                                ),
                              ],
                              fontFamily: 'Schyler'),
                        ),
                        Text(
                          "Scroll down or press the expand button for more",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 10,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 3.0,
                                  color: Colors.black54,
                                ),
                              ],
                              fontFamily: 'Schyler'),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: BackdropFilter(
                            filter: ui.ImageFilter.blur(
                              sigmaX: 9.0,
                              sigmaY: 9.0,
                            ),
                            child: AnimatedContainer(
                              width:
                                  MediaQuery.of(context).size.width / 1.1, //ice
                              height: MediaQuery.of(context).size.height > 490
                                  ? bigsettings == false
                                      ? 320
                                      : MediaQuery.of(context).size.height / 1.3
                                  : bigsettings == false
                                      ? MediaQuery.of(context).size.height / 2
                                      : MediaQuery.of(context).size.height /
                                          1.4,
                              curve: Curves.easeInOutCirc,
                              duration: Duration(
                                  milliseconds: issolid == true ? 0 : 300),
                              decoration: BoxDecoration(
                                color: Color(0x67A49C9C),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Color(0xD7000000),
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x51000000),
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Center(
                                  child: Stack(
                                    children: [
                                      Visibility(
                                          visible: true,
                                          child: AddWidget(
                                            controller: _cr,
                                            visible: random,
                                            ontap2: bigsetting,
                                            setting2: switchsort,
                                            oncall: () {
                                              setState(() {});
                                            },
                                            rantap: () {
                                              setState(() {
                                                //pickrandomwidget();
                                              });
                                            },
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  width: 50,
                  height: 60,
                ) //thing used to add space to the bottom of the widget adder
              ],
            ),
            Column(
              //SETTING
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  //settingadd
                  visible: settingson,
                  child: StreamBuilder<Object>(
                      stream: null,
                      builder: (context, snapshot) {
                        return Listener(
                            onPointerSignal: (ps) {
                              if (ps is PointerScrollEvent) {
                                final newOffset =
                                    _cr.offset + ps.scrollDelta.dy;
                                if (ps.scrollDelta.dy.isNegative) {
                                  _cr.jumpTo(math.max(0, newOffset));
                                } else {
                                  _cr.jumpTo(math.min(
                                      _cr.position.maxScrollExtent, newOffset));
                                }
                              }
                            },
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Settings",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                        fontSize: 25,
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(0.0, 1.0),
                                            blurRadius: 3.0,
                                            color: Colors.black54,
                                          ),
                                        ],
                                        fontFamily: 'Schyler'),
                                  ),
                                  Text(
                                    "Scroll down or press the expand button for more",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                        fontSize: 10,
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(0.0, 1.0),
                                            blurRadius: 3.0,
                                            color: Colors.black54,
                                          ),
                                        ],
                                        fontFamily: 'Schyler'),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30.0),
                                      child: BackdropFilter(
                                        filter: ui.ImageFilter.blur(
                                          sigmaX: 9.0,
                                          sigmaY: 9.0,
                                        ),
                                        child: AnimatedContainer(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.1,
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .height >
                                                  490
                                              ? bigsettings == false
                                                  ? 320
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      1.3
                                              : bigsettings == false
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      2
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      1.4,
                                          curve: Curves.easeInOutCirc,
                                          duration: Duration(
                                              milliseconds:
                                                  issolid == true ? 0 : 300),
                                          decoration: BoxDecoration(
                                            color: Color(0x67A49C9C),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                              color: Color(0xD7000000),
                                              width: 1,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x51000000),
                                                spreadRadius: 1,
                                                blurRadius: 6,
                                                offset: Offset(0,
                                                    2), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            child: Center(
                                              child: Stack(
                                                children: [
                                                  SettingOptions(
                                                    option1: () {
                                                      changegraphics();
                                                    },
                                                    option2: () {
                                                      changeganim();
                                                      changeanimtoonoff();
                                                    },
                                                    option3: () {
                                                      changesolid();
                                                    },
                                                    option4: () {
                                                      changescroll();
                                                    },
                                                    option5: () {
                                                      dockshow();
                                                    },
                                                    option6: () {
                                                      warningshow();
                                                    },
                                                    option7: () {
                                                      randomshow();
                                                    },
                                                    option8: () {
                                                      bordershow();
                                                    },
                                                    option50: () {
                                                      dockstyle();
                                                    },
                                                    option0: () {
                                                      battery_();
                                                    },
                                                    o1text: graphictf,
                                                    o2text: gradtotext,
                                                    o3text: solid,
                                                    o4text: scrollable,
                                                    o5text: solid2,
                                                    o6text: warning,
                                                    o7text: israndom,
                                                    o8text: isborder,
                                                    o0text: isbattery,
                                                    o50text: dstyle,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              MouseRegion(
                                                                onHover: anim3,
                                                                onExit: white3,
                                                                child: InkWell(
                                                                  onTap:
                                                                      bigsetting,
                                                                  child:
                                                                      MouseRegion(
                                                                    onHover:
                                                                        anim3,
                                                                    onExit:
                                                                        white3,
                                                                    child:
                                                                        AnimatedContainer(
                                                                      width: cc3 ==
                                                                              true
                                                                          ? 35
                                                                          : 45,
                                                                      curve: Curves
                                                                          .easeInOutBack,
                                                                      duration: Duration(
                                                                          milliseconds: issolid == true
                                                                              ? 0
                                                                              : 300),
                                                                      height:
                                                                          35,
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .fullscreen_sharp,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        //colors
                                                                        color: cc3 ==
                                                                                true
                                                                            ? Color(0x6cdeb689)
                                                                            : Color(0xddbd986d),
                                                                        borderRadius:
                                                                            BorderRadius.circular(35),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Colors.black,
                                                                          width: cc3 == true
                                                                              ? 1
                                                                              : 2,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      }),
                ),
                Container(
                  width: 50,
                  height: 60,
                ) //thing used to add space to the bottom of the settings adder
              ],
            ),
            Visibility(visible: showwall, child: AddWallpaper()),
            Visibility(
              visible: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text('${MediaQuery.of(context).size.height}')],
              ),
            ),
            Visibility(
              visible: false,
              child: Center(
                child: BackdropFilter(
                  filter: ui.ImageFilter.blur(
                    sigmaX: 1.0,
                    sigmaY: 1.0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(
                        sigmaX: 7.0,
                        sigmaY: 7.0,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.05,
                        width: MediaQuery.of(context).size.width / 1.05,
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xda191919),
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: <Color>[
                                            Colors.white60,
                                            Color(0x6BFFFFFF)
                                          ],
                                        ),
                                      ),
                                      child: TextFormField(
                                        onFieldSubmitted: (text) async {},
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 10,
                                          fontFamily: 'Schyler',
                                        ),
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          hintText:
                                              "Type in a link, ex. https://www.google.com/gmail/about/#)",
                                          fillColor: Colors.black,
                                          focusColor: Colors.black,
                                          hoverColor: Colors.black,
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0x51FFFFFF),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Color(0xD7000000),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x51000000),
                              spreadRadius: 1,
                              blurRadius: 6,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Consumer<AppModel>(builder: (context, value, child) {
              return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  return Visibility(
                    visible: value.logVis,
                    child: Stack(
                      children: [
                        ModalBarrier(
                          dismissible: false,
                        ),
                        Center(
                          child: BackdropFilter(
                            filter: ui.ImageFilter.blur(
                              sigmaX: 1.0,
                              sigmaY: 1.0,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: BackdropFilter(
                                filter: ui.ImageFilter.blur(
                                  sigmaX: 7.5,
                                  sigmaY: 7.5,
                                ),
                                child: Container(
                                  height: MediaQuery.of(context).size.height / 1.05,
                                  width: MediaQuery.of(context).size.width / 1.05,
                                  child: Stack(
                                    children: [

                                      Visibility(
                                          visible: snapshot.data?.displayName == null ? true : false,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: Center(
                                                child: FittedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Visibility(
                                                        visible: false,
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              width: 300,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    Color(0xda191919),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(35),
                                                                border: Border.all(
                                                                  color: Colors.white,
                                                                  width: 2,
                                                                ),
                                                                gradient:
                                                                    LinearGradient(
                                                                  begin: Alignment
                                                                      .bottomCenter,
                                                                  end: Alignment
                                                                      .topCenter,
                                                                  colors: <Color>[
                                                                    Colors.white60,
                                                                    Color(0x6BFFFFFF)
                                                                  ],
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(6.0),
                                                                child: TextFormField(
                                                                  onFieldSubmitted:
                                                                      (text) async {},
                                                                  textAlign: TextAlign
                                                                      .center,
                                                                  style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    fontSize: 20,
                                                                    fontFamily:
                                                                        'Schyler',
                                                                  ),
                                                                  cursorColor:
                                                                      Colors.black,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintText: "Email",
                                                                    fillColor:
                                                                        Colors.black,
                                                                    focusColor:
                                                                        Colors.black,
                                                                    hoverColor:
                                                                        Colors.black,
                                                                    border:
                                                                        InputBorder
                                                                            .none,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              width: 300,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    Color(0xda191919),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(35),
                                                                border: Border.all(
                                                                  color: Colors.white,
                                                                  width: 2,
                                                                ),
                                                                gradient:
                                                                    LinearGradient(
                                                                  begin: Alignment
                                                                      .bottomCenter,
                                                                  end: Alignment
                                                                      .topCenter,
                                                                  colors: <Color>[
                                                                    Colors.white60,
                                                                    Color(0x6BFFFFFF)
                                                                  ],
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(6.0),
                                                                child: TextFormField(
                                                                  onFieldSubmitted:
                                                                      (text) async {},
                                                                  textAlign: TextAlign
                                                                      .center,
                                                                  obscureText: true,
                                                                  style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    fontSize: 20,
                                                                    fontFamily:
                                                                        'Schyler',
                                                                  ),
                                                                  cursorColor:
                                                                      Colors.black,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintText:
                                                                        "Password",
                                                                    fillColor:
                                                                        Colors.black,
                                                                    focusColor:
                                                                        Colors.black,
                                                                    hoverColor:
                                                                        Colors.black,
                                                                    border:
                                                                        InputBorder
                                                                            .none,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              width: 100,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    Color(0xda191919),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(35),
                                                                border: Border.all(
                                                                  color: Colors.white,
                                                                  width: 2,
                                                                ),
                                                                gradient:
                                                                    LinearGradient(
                                                                  begin: Alignment
                                                                      .bottomCenter,
                                                                  end: Alignment
                                                                      .topCenter,
                                                                  colors: <Color>[
                                                                    Colors.white60,
                                                                    Color(0x6BFFFFFF)
                                                                  ],
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(6.0),
                                                                child: Center(
                                                                  child: Text(
                                                                    "Log In",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w900,
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize: 20,
                                                                        shadows: <Shadow>[
                                                                          Shadow(
                                                                            offset: Offset(
                                                                                0.0,
                                                                                1.0),
                                                                            blurRadius:
                                                                                3.0,
                                                                            color: Colors
                                                                                .black54,
                                                                          ),
                                                                        ],
                                                                        fontFamily:
                                                                            'Schyler'),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        "hybriidflow",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color: logerror != true
                                                                ? Colors.white60
                                                                : Color(0xffff8080),
                                                            fontSize: 60,
                                                            shadows: <Shadow>[
                                                              Shadow(
                                                                offset:
                                                                    Offset(0.0, 1.0),
                                                                blurRadius: 3.0,
                                                                color: Colors.black12,
                                                              ),
                                                            ],
                                                            fontFamily: 'Typo'),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Visibility(
                                                        visible: true,
                                                        child: Stack(
                                                          children: [
                                                            Column(
                                                              children: [
                                                                Container(
                                                                  width: 300,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xda191919),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                35),
                                                                    border:
                                                                        Border.all(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                    gradient:
                                                                        LinearGradient(
                                                                      begin: Alignment
                                                                          .bottomCenter,
                                                                      end: Alignment
                                                                          .topCenter,
                                                                      colors: <Color>[
                                                                        Colors
                                                                            .white60,
                                                                        Color(
                                                                            0x6BFFFFFF)
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  child: Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(6.0),
                                                                    child:
                                                                        TextFormField(
                                                                      onChanged:
                                                                          (text) async {
                                                                        registerEmail =
                                                                            text;
                                                                      },
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w900,
                                                                        fontSize: 20,
                                                                        fontFamily:
                                                                            'Schyler',
                                                                      ),
                                                                      cursorColor:
                                                                          Colors
                                                                              .black,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            "Choose Email",
                                                                        fillColor:
                                                                            Colors
                                                                                .black,
                                                                        focusColor:
                                                                            Colors
                                                                                .black,
                                                                        hoverColor:
                                                                            Colors
                                                                                .black,
                                                                        border:
                                                                            InputBorder
                                                                                .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Container(
                                                                  width: 300,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xda191919),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                35),
                                                                    border:
                                                                        Border.all(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                    gradient:
                                                                        LinearGradient(
                                                                      begin: Alignment
                                                                          .bottomCenter,
                                                                      end: Alignment
                                                                          .topCenter,
                                                                      colors: <Color>[
                                                                        Colors
                                                                            .white60,
                                                                        Color(
                                                                            0x6BFFFFFF)
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  child: Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(6.0),
                                                                    child:
                                                                        TextFormField(
                                                                      onChanged:
                                                                          (text) async {
                                                                        registerPassword =
                                                                            text;
                                                                      },
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      obscureText:
                                                                          true,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w900,
                                                                        fontSize: 20,
                                                                        fontFamily:
                                                                            'Schyler',
                                                                      ),
                                                                      cursorColor:
                                                                          Colors
                                                                              .black,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            "Set Password",
                                                                        fillColor:
                                                                            Colors
                                                                                .black,
                                                                        focusColor:
                                                                            Colors
                                                                                .black,
                                                                        hoverColor:
                                                                            Colors
                                                                                .black,
                                                                        border:
                                                                            InputBorder
                                                                                .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Container(
                                                                  width: 300,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xda191919),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                35),
                                                                    border:
                                                                        Border.all(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                    gradient:
                                                                        LinearGradient(
                                                                      begin: Alignment
                                                                          .bottomCenter,
                                                                      end: Alignment
                                                                          .topCenter,
                                                                      colors: <Color>[
                                                                        Colors
                                                                            .white60,
                                                                        Color(
                                                                            0x6BFFFFFF)
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  child: Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(6.0),
                                                                    child:
                                                                        TextFormField(
                                                                      onChanged:
                                                                          (text) async {
                                                                        registerUser =
                                                                            text;
                                                                      },
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w900,
                                                                        fontSize: 20,
                                                                        fontFamily:
                                                                            'Schyler',
                                                                      ),
                                                                      cursorColor:
                                                                          Colors
                                                                              .black,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            "Set Display Name",
                                                                        fillColor:
                                                                            Colors
                                                                                .black,
                                                                        focusColor:
                                                                            Colors
                                                                                .black,
                                                                        hoverColor:
                                                                            Colors
                                                                                .black,
                                                                        border:
                                                                            InputBorder
                                                                                .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Text(
                                                                  "- Password Must be 6 Characters \n- A verification code will be sent to this email to verify your account.",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize: 10,
                                                                      shadows: <Shadow>[
                                                                        Shadow(
                                                                          offset:
                                                                              Offset(
                                                                                  1.0,
                                                                                  1.0),
                                                                          blurRadius:
                                                                              3.0,
                                                                          color: Colors
                                                                              .black12,
                                                                        ),
                                                                      ],
                                                                      fontFamily:
                                                                          'Schyler'),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                InkWell(
                                                                  onTap: () async {
                                                                    try {
                                                                      UserCredential?
                                                                          regist =
                                                                          await registerWithEmailPassword(
                                                                              registerEmail,
                                                                              registerPassword,
                                                                              registerUser);
                                                                      if (regist !=
                                                                          null) {
                                                                        print(
                                                                            "succesess");
                                                                      } else {
                                                                        print(
                                                                            "errorski");
                                                                      }
                                                                    } catch (e) {
                                                                      print(e);
                                                                      temp();
                                                                    }
                                                                  },
                                                                  child: Container(
                                                                    width: 100,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xda191919),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                                  35),
                                                                      border:
                                                                          Border.all(
                                                                        color: Color(
                                                                            0xFFA4DC6D),
                                                                        width: 2.4,
                                                                      ),
                                                                      gradient:
                                                                          LinearGradient(
                                                                        begin: Alignment
                                                                            .bottomCenter,
                                                                        end: Alignment
                                                                            .topCenter,
                                                                        colors: <Color>[
                                                                          Colors
                                                                              .black26,
                                                                          Color(
                                                                              0x6BFFFFFF)
                                                                        ],
                                                                      ),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color: Color(
                                                                              0x1D494949),
                                                                          spreadRadius:
                                                                              1,
                                                                          blurRadius:
                                                                              4,
                                                                          offset: Offset(
                                                                              0,
                                                                              1), // changes position of shadow
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    child: Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .all(
                                                                              6.0),
                                                                      child: Center(
                                                                        child: Text(
                                                                          "Sign Up",
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w900,
                                                                              color: Colors.white,
                                                                              fontSize: 20,
                                                                              shadows: <Shadow>[
                                                                                Shadow(
                                                                                  offset:
                                                                                      Offset(0.0, 1.0),
                                                                                  blurRadius:
                                                                                      3.0,
                                                                                  color:
                                                                                      Colors.black54,
                                                                                ),
                                                                              ],
                                                                              fontFamily: 'Schyler'),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Visibility(
                                                        visible: false,
                                                        child: Stack(
                                                          children: [
                                                            Column(
                                                              children: [
                                                                Container(
                                                                  width: 300,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xda191919),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                35),
                                                                    border:
                                                                        Border.all(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                    gradient:
                                                                        LinearGradient(
                                                                      begin: Alignment
                                                                          .bottomCenter,
                                                                      end: Alignment
                                                                          .topCenter,
                                                                      colors: <Color>[
                                                                        Colors
                                                                            .white60,
                                                                        Color(
                                                                            0x6BFFFFFF)
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  child: Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(6.0),
                                                                    child:
                                                                        TextFormField(
                                                                      onChanged:
                                                                          (text) async {
                                                                        signEmail =
                                                                            text;
                                                                      },
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w900,
                                                                        fontSize: 20,
                                                                        fontFamily:
                                                                            'Schyler',
                                                                      ),
                                                                      cursorColor:
                                                                          Colors
                                                                              .black,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            "Enter Email",
                                                                        fillColor:
                                                                            Colors
                                                                                .black,
                                                                        focusColor:
                                                                            Colors
                                                                                .black,
                                                                        hoverColor:
                                                                            Colors
                                                                                .black,
                                                                        border:
                                                                            InputBorder
                                                                                .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Container(
                                                                  width: 300,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xda191919),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                35),
                                                                    border:
                                                                        Border.all(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                    gradient:
                                                                        LinearGradient(
                                                                      begin: Alignment
                                                                          .bottomCenter,
                                                                      end: Alignment
                                                                          .topCenter,
                                                                      colors: <Color>[
                                                                        Colors
                                                                            .white60,
                                                                        Color(
                                                                            0x6BFFFFFF)
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  child: Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(6.0),
                                                                    child:
                                                                        TextFormField(
                                                                      onChanged:
                                                                          (text) async {
                                                                        signPassword =
                                                                            text;
                                                                      },
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      obscureText:
                                                                          true,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w900,
                                                                        fontSize: 20,
                                                                        fontFamily:
                                                                            'Schyler',
                                                                      ),
                                                                      cursorColor:
                                                                          Colors
                                                                              .black,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            "Enter Password",
                                                                        fillColor:
                                                                            Colors
                                                                                .black,
                                                                        focusColor:
                                                                            Colors
                                                                                .black,
                                                                        hoverColor:
                                                                            Colors
                                                                                .black,
                                                                        border:
                                                                            InputBorder
                                                                                .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                InkWell(
                                                                  onTap: () async {
                                                                    try {
                                                                      UserCredential?
                                                                          regist =
                                                                          await loginwemailandpassword(
                                                                              signEmail,
                                                                              signPassword,
                                                                              );
                                                                      if (regist !=
                                                                          null) {
                                                                        print(
                                                                            "succesess");
                                                                      } else {
                                                                        print(
                                                                            "errorski");
                                                                      }
                                                                    } catch (e) {
                                                                      print(e);
                                                                      temp();
                                                                    }
                                                                  },
                                                                  child: Container(
                                                                    width: 100,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xda191919),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                                  35),
                                                                      border:
                                                                          Border.all(
                                                                        color: Color(
                                                                            0xFFA4DC6D),
                                                                        width: 2.4,
                                                                      ),
                                                                      gradient:
                                                                          LinearGradient(
                                                                        begin: Alignment
                                                                            .bottomCenter,
                                                                        end: Alignment
                                                                            .topCenter,
                                                                        colors: <Color>[
                                                                          Colors
                                                                              .black26,
                                                                          Color(
                                                                              0x6BFFFFFF)
                                                                        ],
                                                                      ),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color: Color(
                                                                              0x1D494949),
                                                                          spreadRadius:
                                                                              1,
                                                                          blurRadius:
                                                                              4,
                                                                          offset: Offset(
                                                                              0,
                                                                              1), // changes position of shadow
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    child: Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .all(
                                                                              6.0),
                                                                      child: Center(
                                                                        child: Text(
                                                                          "Log In",
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w900,
                                                                              color: Colors.white,
                                                                              fontSize: 20,
                                                                              shadows: <Shadow>[
                                                                                Shadow(
                                                                                  offset:
                                                                                      Offset(0.0, 1.0),
                                                                                  blurRadius:
                                                                                      3.0,
                                                                                  color:
                                                                                      Colors.black54,
                                                                                ),
                                                                              ],
                                                                              fontFamily: 'Schyler'),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 40,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(
                                                                width: 100,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xda191919),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              35),
                                                                  border: Border.all(
                                                                    color:
                                                                        Colors.white,
                                                                    width: 2,
                                                                  ),
                                                                  gradient:
                                                                      LinearGradient(
                                                                    begin: Alignment
                                                                        .bottomCenter,
                                                                    end: Alignment
                                                                        .topCenter,
                                                                    colors: <Color>[
                                                                      Colors.white60,
                                                                      Color(
                                                                          0x6BFFFFFF)
                                                                    ],
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(6.0),
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Register",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.w900,
                                                                          color: Colors.white,
                                                                          fontSize: 20,
                                                                          shadows: <Shadow>[
                                                                            Shadow(
                                                                              offset: Offset(
                                                                                  0.0,
                                                                                  1.0),
                                                                              blurRadius:
                                                                                  3.0,
                                                                              color: Colors
                                                                                  .black54,
                                                                            ),
                                                                          ],
                                                                          fontFamily: 'Schyler'),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                "Or",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    color:
                                                                        Colors.white,
                                                                    fontSize: 20,
                                                                    shadows: <Shadow>[
                                                                      Shadow(
                                                                        offset:
                                                                            Offset(
                                                                                0.0,
                                                                                1.0),
                                                                        blurRadius:
                                                                            3.0,
                                                                        color: Colors
                                                                            .black54,
                                                                      ),
                                                                    ],
                                                                    fontFamily:
                                                                        'Schyler'),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Container(
                                                                width: 100,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xda191919),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              35),
                                                                  border: Border.all(
                                                                    color:
                                                                        Colors.white,
                                                                    width: 2,
                                                                  ),
                                                                  gradient:
                                                                      LinearGradient(
                                                                    begin: Alignment
                                                                        .bottomCenter,
                                                                    end: Alignment
                                                                        .topCenter,
                                                                    colors: <Color>[
                                                                      Colors.white60,
                                                                      Color(
                                                                          0x6BFFFFFF)
                                                                    ],
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(6.0),
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Log In",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.w900,
                                                                          color: Colors.white,
                                                                          fontSize: 20,
                                                                          shadows: <Shadow>[
                                                                            Shadow(
                                                                              offset: Offset(
                                                                                  0.0,
                                                                                  1.0),
                                                                              blurRadius:
                                                                                  3.0,
                                                                              color: Colors
                                                                                  .black54,
                                                                            ),
                                                                          ],
                                                                          fontFamily: 'Schyler'),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  color: Color(0xda191919),
                                                  borderRadius:
                                                      BorderRadius.circular(35),
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 2,
                                                  ),
                                                  gradient: LinearGradient(
                                                    begin: Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                    colors: <Color>[
                                                      Colors.white60,
                                                      Color(0x6BFFFFFF)
                                                    ],
                                                  ),
                                                ),
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(6.0),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color:
                                                                  Color(0xD8FFFFFF),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(35),
                                                              border: Border.all(
                                                                color: Colors.white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(6.0),
                                                              child: Center(
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      "Sign In With Google",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w900,
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              20,
                                                                          fontFamily:
                                                                              'Schyler'),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 30,
                                                                      height: 30,
                                                                      child:
                                                                          FittedBox(
                                                                        child: Image(
                                                                            image: AssetImage(
                                                                                'assets/googleicon.png')),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color:
                                                                  Color(0xda191919),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(35),
                                                              border: Border.all(
                                                                color: Colors.white,
                                                                width: 2,
                                                              ),
                                                              gradient:
                                                                  LinearGradient(
                                                                begin: Alignment
                                                                    .bottomCenter,
                                                                end: Alignment
                                                                    .topCenter,
                                                                colors: <Color>[
                                                                  Colors.white60,
                                                                  Color(0x6BFFFFFF)
                                                                ],
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2.0),
                                                              child: Center(
                                                                child: Text(
                                                                  "Register/Log In with FlowAccount",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900,
                                                                      color: Colors
                                                                          .black54,
                                                                      shadows: <Shadow>[
                                                                        Shadow(
                                                                          offset:
                                                                              Offset(
                                                                                  0.0,
                                                                                  1.0),
                                                                          blurRadius:
                                                                              3.0,
                                                                          color: Colors
                                                                              .black12,
                                                                        ),
                                                                      ],
                                                                      fontFamily:
                                                                          'Schyler'),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            MouseRegion(
                                              onHover: anim7,
                                              onExit: falseanim7,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(35),
                                                child: BackdropFilter(
                                                  filter: ui.ImageFilter.blur(
                                                    sigmaX: 2.0,
                                                    sigmaY: 2.0,
                                                  ),
                                                  child: InkWell(child:
                                                      Consumer<AppModel>(builder:
                                                          (context, value, child) {
                                                    return AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds:
                                                              issolid == true
                                                                  ? 0
                                                                  : 300),
                                                      curve: Curves.easeInOutBack,
                                                      width: cc7 == true ? 35 : 48,
                                                      height: 35,
                                                      child: Icon(
                                                          Icons.highlight_remove,
                                                          color: Color(0xff000000)),
                                                      decoration: BoxDecoration(
                                                        //colors
                                                        color: Color(0xdaff0000),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                35),
                                                        border: Border.all(
                                                          color: Colors.black,
                                                          width:
                                                              cc7 == true ? 0 : 2,
                                                        ),
                                                        gradient: LinearGradient(
                                                          begin:
                                                              Alignment.topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: <Color>[
                                                            cc7 == true
                                                                ? Color(0x4fff6c52)
                                                                : Color(0xffff6c52),
                                                            cc7 == true
                                                                ? Color(0x4fff6c52)
                                                                : Color(0xffff6c52)
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }), onTap: () {
                                                    setState(() {
                                                      value.setlog();
                                                    });
                                                  }),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0x3AA9A9A9),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Color(0xC5282828),
                                      width: 1.4,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x51000000),
                                        spreadRadius: 1,
                                        blurRadius: 6,
                                        offset: Offset(
                                            0, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              );
            })
          ],
        ),
      ),
    );
  }

  _animateToIndex(i) => _controller.animateTo(_height * i,
      duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
}
//Container(
//                           height: 100,
//                           width: 100,
//                           color: Colors.white,
//                           child: Text(entries.length > 1 ?'There are ${entries.length } Squares' : 'There is 1 Square'),
//                         ),

class option extends StatefulWidget {
  final text;
  final category;
  final add;
  final color;

  const option({Key? key, this.text, this.add, this.color, this.category})
      : super(key: key);
  @override
  _optionState createState() => _optionState();
}

class _optionState extends State<option> {
  bool cc = true;

  void white(PointerEvent details) {
    setState(() {
      cc = true;
    });
  }

  void anim(PointerEvent details) {
    setState(() {
      cc = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 10,
          ),
          SizedBox(
            child: MouseRegion(
              onHover: anim,
              onExit: white,
              child: InkWell(
                onTap: widget.add,
                child: Center(
                  //MediaQuery.of(context).size.width > 800
                  //cc == true ? 100 : 120,
                  //
                  child: AnimatedContainer(
                    height: MediaQuery.of(context).size.width > 1000
                        ? cc == true
                            ? 100
                            : 115
                        : cc == true
                            ? 90
                            : 110,
                    width: MediaQuery.of(context).size.width > 1000
                        ? cc == true
                            ? 185
                            : 185
                        : cc == true
                            ? 175
                            : 175,
                    curve: Curves.easeInOutCirc,
                    duration: Duration(milliseconds: issolid == true ? 0 : 250),
                    child: Center(
                      child: AnimatedContainer(
                        curve: Curves.easeInOutBack,
                        duration:
                            Duration(milliseconds: issolid == true ? 0 : 250),
                        child: Center(
                            child: Center(
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                Stack(
                                  children: [
                                    Visibility(
                                      child: Column(
                                        children: [
                                          Text(
                                            widget.text,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                color: Color(0xffe5e5e5),
                                                fontSize: 26,
                                                shadows: <Shadow>[
                                                  Shadow(
                                                    offset: Offset(0.0, 1.0),
                                                    blurRadius: 3.0,
                                                    color: Colors.black54,
                                                  ),
                                                ],
                                                fontFamily: 'Schyler'),
                                          ),
                                          Text(
                                            widget.category,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                color: Color(0xffa2a2a2),
                                                fontSize: 18,
                                                shadows: <Shadow>[
                                                  Shadow(
                                                    offset: Offset(0.0, 1.0),
                                                    blurRadius: 3.0,
                                                    color: Colors.black54,
                                                  ),
                                                ],
                                                fontFamily: 'Schyler'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                              ],
                            ),
                          ),
                        )),
                        decoration: BoxDecoration(
                          //colors
                          color: Color(0xda191919),
                          borderRadius: BorderRadius.circular(38),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              cc == false
                                  ? Color(0x991E1E1E)
                                  : Color(0xBE626162),
                              cc == true
                                  ? Color(0x991E1E1E)
                                  : Color(0xBE626162),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}

class blurwidget extends StatefulWidget {
  final what;

  const blurwidget({Key? key, this.what}) : super(key: key);
  @override
  _blurwidgetState createState() => _blurwidgetState();
}

class _blurwidgetState extends State<blurwidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: GestureDetector(
          onTap: widget.what,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black12,
          ),
        ),
      ),
    );
  }
}

class blackedoutwidget extends StatefulWidget {
  final what;

  const blackedoutwidget({Key? key, this.what}) : super(key: key);
  @override
  _blackedoutwidgetState createState() => _blackedoutwidgetState();
}

class _blackedoutwidgetState extends State<blackedoutwidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: GestureDetector(
        onTap: widget.what,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.black, Color(0xff212121)],
            ),
          ),
        ),
      ),
    );
  }
}

class hilly extends StatefulWidget {
  @override
  _hillyState createState() => _hillyState();
}

class _hillyState extends State<hilly> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: OverflowBox(
        child: Image(
          image: AssetImage(wp),
          fit: BoxFit.cover,
        ),
        maxWidth: double.infinity,
        maxHeight: double.infinity,
      ),
    );
  }
}

final List<Key> keys = [
  UniqueKey(), // key for Calculator widget
  UniqueKey(), // key for Dict widget
];

final List<Widget> entries = [];
List<WidgetEntry> entries2 = [
  // WidgetEntry("counter", {
  //   "number": 2,
  //   "size": 90,
  // }),
  // WidgetEntry("ran", {
  //   "number": 0,
  //   "max": 100,
  //   "min": 50,
  // }),
  // WidgetEntry("qr", {
  //   "urlskii":
  //       "https://api.qrserver.com/v1/create-qr-code/?size=230x230&data=hybriidflow&bgcolor=B9B9B9",
  //   "urlskii2": "https://hybriidbox.app/spotify/",
  //   "quality": "230x230",
  //   "color": "B9B9B9"
  // }),
  // WidgetEntry("last", {
  //   "number": 0,
  //   "max": 100,
  // }),
];

class AddWidget extends StatefulWidget {
  final controller;
  final o_list;

  final visible;
  final setting2;
  final ontap;
  final ontap2;
  final oncall;
  final rantap;

  const AddWidget(
      {Key? key,
      this.controller,
      this.o_list,
      this.visible,
      this.ontap,
      this.ontap2,
      this.setting2,
      this.oncall,
      this.rantap})
      : super(key: key);
  @override
  _AddWidgetState createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  List<WidgetSlotContainer> widgetstoadd = [
    // WidgetSlotContainer(
    //   'ChatGPT',
    //   gptbot(),
    //   false,
    //   widgetsort == 1 ? 'AI' : '',
    //   widgetsort == 2 ? Color(0xFF496543) : Color(0x697E7E7E),
    //   ValueKey('dic_1'),
    // ),
    WidgetSlotContainer(
      'Dictionary',
      false,
      widgetsort == 1 ? 'Tool' : '',
      widgetsort == 2 ? Color(0xFF496543) : Color(0x697E7E7E),
      ValueKey('dic_1'),
      WidgetEntry("dict", {
        "def": "",
      }),
    ),
    WidgetSlotContainer(
      'Counter',
      false,
      widgetsort == 1 ? 'Tool' : '',
      widgetsort == 2 ? Color(0xFF496543) : Color(0x697E7E7E),
      ValueKey('counter_1'),
      WidgetEntry("counter", {
        "number": 2,
        "size": 90,
      }),
    ),
    WidgetSlotContainer(
      'QuickLinks',
      false,
      widgetsort == 1 ? 'Tool' : '',
      widgetsort == 2 ? Color(0xFF496543) : Color(0x697E7E7E),
      ValueKey('quick_!'),
      WidgetEntry("qls", {
        "links": ["https://www.youtube.com/", "https://hybriidbox.app/spotify/"]
      }),
    ),
    WidgetSlotContainer(
      'Random Number',
      false,
      widgetsort == 1 ? 'Tool' : '',
      widgetsort == 2 ? Color(0xFF496543) : Color(0x697E7E7E),
      ValueKey('dic_1'),
      WidgetEntry("ran", {
        "number": 0,
        "max": 100,
        "min": 0,
      }),
    ),
    WidgetSlotContainer(
      'Image Viewer',
      true,
      widgetsort == 1 ? 'Tool' : '',
      widgetsort == 2 ? Color(0xFF496543) : Color(0x697E7E7E),
      ValueKey('dic_1'),
      WidgetEntry("img", {
        "url": 0,
      }),
    ),
    WidgetSlotContainer(
      'QR Code Creator',
      false,
      widgetsort == 1 ? 'Tool' : '',
      widgetsort == 2 ? Color(0xFF496543) : Color(0x697E7E7E),
      ValueKey('dic_1'),
      WidgetEntry("qr", {
        "urlskii":
            "https://api.qrserver.com/v1/create-qr-code/?size=230x230&data=hybriidflow&bgcolor=B9B9B9",
        "urlskii2": "https://hybriidbox.app/spotify/",
        "quality": "230x230",
        "color": "B9B9B9"
      }),
    ),
    WidgetSlotContainer(
      'LastFM Scrobbler',
      false,
      widgetsort == 1 ? 'Tool' : '',
      widgetsort == 2 ? Color(0xFF496543) : Color(0x697E7E7E),
      ValueKey('dic_1'),
      WidgetEntry("last", {
        "username": "hinac",
        "userin": false,
      }),
    ),

    // WidgetSlotContainer('FImage Viewer', fimageviewer(), true),

    WidgetSlotContainer(
      'Analog Clock',
      false,
      widgetsort == 1 ? 'Info' : '',
      widgetsort == 2 ? Color(0xFF436465) : Color(0x697E7E7E),
      ValueKey('dic_1'),
      WidgetEntry("analog", {
        "username": "",
      }),
    ),
    WidgetSlotContainer(
      'World Map',
      false,
      widgetsort == 1 ? 'Info' : '',
      widgetsort == 2 ? Color(0xFF436465) : Color(0x697E7E7E),
      ValueKey('dic_1'),
      WidgetEntry("wrldmap", {
        "username": "",
      }),
    ),
    WidgetSlotContainer(
      'Time and Date',
      false,
      widgetsort == 1 ? 'Info' : '',
      widgetsort == 2 ? Color(0xFF436465) : Color(0x697E7E7E),
      ValueKey('dic_1'),
      WidgetEntry("td", {
        "username": "",
      }),
    ),
    WidgetSlotContainer(
      'Time',
      false,
      widgetsort == 1 ? 'Info' : '',
      widgetsort == 2 ? Color(0xFF436465) : Color(0x697E7E7E),
      ValueKey('dic_1'),
      WidgetEntry("t", {
        "username": "",
      }),
    ),
    // WidgetSlotContainer(
    //   'World Clock',
    //   false,
    //   widgetsort == 1 ? 'Info' : '',
    //   widgetsort == 2 ? Color(0xFF436465) : Color(0x697E7E7E),
    //   ValueKey('dic_1'),
    //   WidgetEntry("world", {
    //     "username": "",
    //   }),
    // ),

    WidgetSlotContainer(
      'Date',
      false,
      widgetsort == 1 ? 'Info' : '',
      widgetsort == 2 ? Color(0xFF436465) : Color(0x697E7E7E),
      ValueKey('dic_1'),
      WidgetEntry("date", {
        "username": "",
      }),
    ),
    WidgetSlotContainer(
      'Platform',
      false,
      widgetsort == 1 ? 'Info' : '',
      widgetsort == 2 ? Color(0xFF436465) : Color(0x697E7E7E),
      ValueKey('dic_1'),
      WidgetEntry("plat", {
        "username": "",
      }),
    ),

    WidgetSlotContainer(
      'Random Joke',
      false,
      widgetsort == 1 ? 'Fun' : '',
      widgetsort == 2 ? Color(0xFF654362) : Color(0x697E7E7E),
      ValueKey('dic_1'),
      WidgetEntry("joke", {
        "topjoke": "",
        "bottomjoke": "",
      }),
    ),

    WidgetSlotContainer(
      'Mirror (Beta)',
      false,
      widgetsort == 1 ? 'Tool' : '',
      Color(0xFF9C6D6D),
      ValueKey('dic_1'),
      WidgetEntry("mirror", {
        "username": "",
      }),
    ),

    WidgetSlotContainer(
      'Translator (BETA)',
      false,
      widgetsort == 1 ? 'Tool' : '',
      Color(0xFF9C6D6D),
      ValueKey('dic_1'),
      WidgetEntry("translate", {
        "username": "",
      }),
    ),
    WidgetSlotContainer(
      'Battery (BETA)',
      false,
      widgetsort == 1 ? 'Info' : '',
      Color(0xFF9C6D6D),
      ValueKey('dic_1'),
      WidgetEntry("battery", {
        "username": "",
      }),
    ),
  ];
  final ScrollController _firstController = ScrollController();
  bool cc3 = true;

  void white3(PointerEvent details) {
    setState(() {
      cc3 = true;
    });
  }

  void anim3(PointerEvent details) {
    setState(() {
      cc3 = false;
    });
  }

  void addimage() {
    entries.add(imageviewer());
  }

  final List<String> categories = <String>[
    'Tools',
    'Info Widgets',
  ];
  final ScrollController _controller = ScrollController();
  final FocusNode _focusNode = FocusNode();

  String eee = 'widgetstoadd';
  void _handleKeyEvent(RawKeyEvent event) {
    var offset = _firstController.offset;
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      setState(() {
        if (kReleaseMode) {
          _firstController.animateTo(offset - 30,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
          print('Scroll working');
        } else {
          _firstController.animateTo(offset - 30,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
          print('Scroll working');
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      setState(() {
        if (kReleaseMode) {
          _firstController.animateTo(offset + 30,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
          print('Scroll working');
        } else {
          _firstController.animateTo(offset + 30,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
          print('Scroll working');
        }
      });
    }
  }

  @override
  // void dispose() {
  //   _focusNode.dispose();
  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Scrollbar(
            thumbVisibility: true,
            controller: _firstController,
            child: RawKeyboardListener(
              focusNode: _focusNode,
              autofocus: true,
              onKey: _handleKeyEvent,
              child: SingleChildScrollView(
                controller: _firstController,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Wrap(
                      runSpacing: 15.0,
                      alignment: WrapAlignment.center,
                      children: [
                        for (int i = 0; i < widgetstoadd.length; i++)
                          Column(
                            children: [
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                  child: option(
                                text: widgetstoadd[i].name,
                                category: widgetstoadd[i].categories,
                                color: widgetstoadd[i].color,
                                add: () {
                                  widget.oncall?.call();
                                  setState(() {
                                    entries2.add(widgetstoadd[i].widget2);
                                    opened = false;
                                    print(jsonEncode(
                                        widgetstoadd[i].widget2.toJson()));
                                  }); //add a new widget;

                                  print('PRINT ${entries}');
                                  setState(() {
                                    on = false;
                                    isanythingopen = false;
                                    print('${isanythingopen} IS W');
                                  });
                                },
                              )),
                            ],
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Visibility(
                      visible: widget.visible,
                      child: InkWell(
                        onTap: widget.rantap,
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            //colors
                            color: Color(0xda191919),
                            borderRadius: BorderRadius.circular(38),
                            border: Border.all(
                              color: Color(0x90D5BD9E),
                              width: 2,
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Color(0x991E1E1E),
                                Color(0x90D5BD9E),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Random Widget",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  fontSize: 14,
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
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Visibility(
                      visible: false,
                      child: Wrap(
                        runSpacing: 50.0,
                        children: [
                          for (int i = 0; i < categories.length; i++)
                            Column(
                              children: [
                                SizedBox(
                                  height: 4,
                                ),
                                Container(
                                    child: option(
                                  text: "yayo",
                                  add: () {
                                    print('PRINT ${entries}');
                                    setState(() {
                                      on = false;
                                      isanythingopen = false;
                                      print('${isanythingopen} IS W');
                                    });
                                  },
                                )),
                              ],
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Visibility(
                                visible: widget.visible,
                                child: InkWell(
                                  onTap: widget.ontap,
                                  child: Container(
                                    width: 200,
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        'Back',
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
                                      color: Color(0xff658e5c),
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                        color: Color(0xffcb9509),
                                        width: 3,
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: <Color>[
                                          Color(0xffffe25c),
                                          Color(0xDCBD892D)
                                        ],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          spreadRadius: -12.0,
                                          blurRadius: 12.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
                child: ClipRRect(
              borderRadius: new BorderRadius.only(
                bottomLeft: const Radius.circular(30.0),
                bottomRight: const Radius.circular(30.0),
              ),
              child: Visibility(
                visible: false,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: issolid == true ? 0 : 300),
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 40,
                  curve: Curves.easeInOutCirc,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment
                          .bottomCenter, // 10% of the width, so there are ten blinds.
                      colors: [
                        Colors.transparent,
                        Color(0x70000000),
                      ], // red to yellow
                      // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    MouseRegion(
                      onHover: anim3,
                      onExit: white3,
                      child: InkWell(
                        onTap: widget.ontap2,
                        child: MouseRegion(
                          onHover: anim3,
                          onExit: white3,
                          child: AnimatedContainer(
                            width: cc3 == true ? 35 : 45,
                            curve: Curves.easeInOutBack,
                            duration: Duration(
                                milliseconds: issolid == true ? 0 : 300),
                            height: 35,
                            child: Icon(
                              Icons.fullscreen_sharp,
                              color: Colors.black,
                            ),
                            decoration: BoxDecoration(
                              //colors
                              color: cc3 == true
                                  ? Color(0x6cdeb689)
                                  : Color(0xddbd986d),
                              borderRadius: BorderRadius.circular(35),
                              border: Border.all(
                                color: Colors.black,
                                width: cc3 == true ? 1 : 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(),
          ],
        )
      ],
    );
  }
}
