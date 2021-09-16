import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -20,
              left: -30,
              child: Image.asset(
                "asset/image/circle.png",
                width: size.width * 0.2,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  "asset/image/logo.png",
                  width: size.width * 0.4,
                  //height: size.height * 0.35,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Welcome to KMUTNB",
                  style: TextStyle(
                    color: pColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Image(
                  image: NetworkImage(
                      "https://stillvacation.com/codex/2021/02/Booking.jpg"),
                  width: size.width * 0.8,
                  // height: size.height * 0.9,
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(100, 10, 120, 10),
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    "SING IN",
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () {
                    print("Hello World");
                    Navigator.pushNamed(context, 'Login');
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(100, 15, 120, 15),
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(fontSize: 22),
                  ),
                  onPressed: () {
                    print("Hello World");
                    Navigator.pushNamed(context, 'Register');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
