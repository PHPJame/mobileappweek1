import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';
import 'package:mobileappweek1/screen/Dashboard.dart';
import 'package:mobileappweek1/screen/FBlogin.dart';
import 'package:mobileappweek1/screen/FBregister.dart';
import 'package:mobileappweek1/screen/Login.dart';
import 'package:mobileappweek1/screen/Store.dart';
//import 'package:mobileappweek1/screen/Register.dart';
import 'package:mobileappweek1/screen/index.dart';
import 'package:mobileappweek1/screen/packimage.dart';
import 'package:mobileappweek1/screen/packlocation.dart';
import 'package:mobileappweek1/screen/packvideo.dart';

//void main() => runApp(MyApp());
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Index(),
      routes: {
        'index': (context) => Index(),
        'Login': (context) => FBlogin(),
        'Register': (context) => FBregister(),
        'Dashboard': (context) => Dashboard(),
        'Video': (context) => PackVideo(),
        'Image': (context) => PackImage(),
        'Location': (context) => PackLocation(),
        'Store': (context) => Store(),
      },
      theme: ThemeData(primaryColor: pColor, secondaryHeaderColor: pColor),
    );
  }
}
