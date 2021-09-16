import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';
import 'package:mobileappweek1/screen/Login.dart';
import 'package:mobileappweek1/screen/Register.dart';
import 'package:mobileappweek1/screen/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Index(),
      routes: {
        'Login': (context) => Login(),
        'Register': (context) => Register(),
      },
      theme: ThemeData(primaryColor: sColor, secondaryHeaderColor: sColor),
    );
  }
}
