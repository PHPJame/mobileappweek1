import 'package:flutter/material.dart';

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
                    color: Colors.orange[900],
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image(
                  image: NetworkImage(
                      "https://stillvacation.com/codex/2021/02/Booking.jpg"),
                  width: size.width * 0.9,
                  // height: size.height * 0.9,
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber[900],
                    padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () {
                    print("Hello World");
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber[900],
                    padding: EdgeInsets.fromLTRB(120, 15, 120, 15),
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    print("Hello World");
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
