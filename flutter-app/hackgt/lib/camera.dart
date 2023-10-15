import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hackgt/model.dart';


class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return FlutterCamera(
      color: Colors.amber,
      onImageCaptured: (value) {
        //final path = value.path;
        // print("::::::::::::::::::::::::::::::::: $path");
        // if (path.contains('.jpg')) {
        //   showDialog(
        //       context: context,
        //       builder: (context) {
        //         return AlertDialog(
        //           content: Image.file(File(path)),
        //         );
        //       });
        // }
      },
      onVideoRecorded: (value) {
        final path = value.path;
        // print('::::::::::::::::::::::::;; $path');
        //Show video preview .mp4
        final storageRef = FirebaseStorage.instance.ref();
        File file = File(path);
        storageRef.child("newVideos/test.mp4").putFile(file);
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => const ModelPage()));
      },
    );
    // return Container();
  }
}