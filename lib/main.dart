import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';
import 'package:mobileappweek1/screen/Dashboard.dart';
import 'package:mobileappweek1/screen/Login.dart';
import 'package:mobileappweek1/screen/Register.dart';
import 'package:mobileappweek1/screen/index.dart';
import 'package:mobileappweek1/screen/packimage.dart';
import 'package:mobileappweek1/screen/packlocation.dart';
import 'package:mobileappweek1/screen/packvideo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Index(),
      routes: {
        'Login': (context) => Login(),
        'Register': (context) => Register(),
        'Dashboard': (context) => Dashboard(),
        'Video': (context) => PackVideo(),
        'Image': (context) => PackImage(),
        'Location': (context) => PackLocation(),
      },
      theme: ThemeData(primaryColor: pColor, secondaryHeaderColor: pColor),
    );
  }
}
