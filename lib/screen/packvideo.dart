import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class PackVideo extends StatefulWidget {
  const PackVideo({Key? key}) : super(key: key);

  @override
  _PackVideoState createState() => _PackVideoState();
}

class _PackVideoState extends State<PackVideo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Vedio"),
        ),
        body: Center(
          child: BetterPlayer.network(
            "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
            betterPlayerConfiguration:
                BetterPlayerConfiguration(autoPlay: true),
          ),
        ),
      ),
    );
  }
}
