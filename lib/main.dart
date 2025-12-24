import 'dart:ui';
import 'dart:ui' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hybriidflow/global/globvabs.dart';
import 'package:hybriidflow/pages/average.dart';
import 'package:hybriidflow/pages/main.dart';
import 'package:hybriidflow/pages/time.dart';
import 'package:hybriidflow/pages/unknown.dart';
import 'package:hybriidflow/providers/appmodel.dart';
import 'package:hybriidflow/widgets/slots/livetime.dart';
import 'package:page_transition/page_transition.dart';
import 'pages/firstpage.dart';
import 'dart:ui_web';

import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:html' as html;



import 'pages/mainsimple.dart';
// ignore: avoid_web_libraries_in_flutter





Future<UserCredential> signInWithGoogle() async {
  // Create a new provider
  GoogleAuthProvider googleProvider = GoogleAuthProvider();

  googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
  googleProvider.setCustomParameters({
    'login_hint': 'user@example.com'
  });

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithPopup(googleProvider);

  // Or use signInWithRedirect
  // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
}

Future<void> main() async {
  GoogleAuthProvider googleProvider = GoogleAuthProvider();

  googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
  googleProvider.setCustomParameters({
    'login_hint': 'user@example.com'
  });

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await FirebaseAuth.instance.signInAnonymously();
  // if (FirebaseAuth.instance.currentUser == null) {
  //   await signInWithGoogle();
  // }


  print('Firebase initialized successfully');




  runApp(MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => AppModel()),
        ChangeNotifierProvider(create: (_) => FMModel()),
        ChangeNotifierProvider(create: (_) => QRModel()),

      ],
      child: MyApp()));
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future<void> timercount() async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        activecount++;
      });
    });

    void open() {
      Navigator.push(context,
          PageTransition(type: PageTransitionType.fade, child: timepage()));
    }

    if (activecount >= 9)
      open();
    else
      timercount();
  }

  void initState() {
     // debugPrintRebuildDirtyWidgets = true;
    super.initState();
    setState(() {});

    //timercount();
  }

  @override
  Widget build(BuildContext context) {
    //blank print("main page built");


    return Listener(
      //onPointerDown: (_) => //blank print('down'), // best place to reset timer imo
      //onPointerMove: (_) => //blank print('move'),
      //onPointerUp: (_) => //blank print('up'),

      child: MaterialApp(
        title: 'HybriidFlow',
        debugShowCheckedModeBanner: false,
        scrollBehavior: MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        initialRoute: mainpage.route,
        routes: {
          firstpage.route: (context) => firstpage(),
          mainpage.route: (context) => mainpage(),
          timepage.route: (context) => timepage(),
          simplepage.route: (context) => simplepage(),
          MyHomePage.route: (context) => MyHomePage(),
        },
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (context) => unknownpage()),
      ),
    );
  }
}
