import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PackImage extends StatefulWidget {
  const PackImage({Key? key}) : super(key: key);

  @override
  _PackImageState createState() => _PackImageState();
}

class _PackImageState extends State<PackImage> {
  var file;
  Future<void> openCamera() async {
    var picker = ImagePicker();
    var photo = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      file = File(photo!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Image"),
        ),
        body: Center(
          child: file == null ? Text("Not Found") : Image.file(file),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Camara");
            openCamera();
          },
          child: Icon(Icons.camera_enhance_outlined),
          backgroundColor: Colors.lightBlue,
        ),
      ),
    );
  }
}
