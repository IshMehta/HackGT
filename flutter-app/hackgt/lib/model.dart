import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';



class ModelPage extends StatefulWidget{
  const ModelPage({Key? key}) : super(key: key);

  @override
  _ModelPageState createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
  final storageRef = FirebaseStorage.instance.ref();
  String downloadURL = '';

  Future<String> fetchDownloadURL() async {
    print("##########################################");
    // final something =  await storageRef.child("Hubble.glb").getDownloadURL();
    final something = await storageRef.child("render/test2.glb").getDownloadURL();
    downloadURL = something;
    print("##########################################");
    return something;
  }
  //
  // @override
  // Widget build(BuildContext context) {
  //   String imageUrl = "";
  //   // final  something =  storageRef.child("Hubble.glb").getDownloadURL();
  //   // print("##########################################");
  //   // something.then((value) => print(value)).catchError((error) => print(error));
  //   //
  //   // print(something);
  //   // print("##########################################");
  //   // if (something == null){
  //   //   String imageUrl = "https://modelviewer.dev/shared-assets/models/Astronaut.glb";
  //   // } else {
  //   //   imageUrl = something as String;
  //   // }
  //   fetchDownloadURL();
  //   return Scaffold(
  //    appBar: AppBar(title: const Text('Model Viewer')),
  //     body: ModelViewer(
  //       backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
  //       src: imageUrl,
  //       alt: 'A 3D model of an astronaut',
  //       ar: true,
  //       arModes: ['scene-viewer', 'webxr', 'quick-look'],
  //       autoRotate: true,
  //       iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
  //       disableZoom: true,
  //     ),
  //   );
  // }


  // attempt 2
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchDownloadURL(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          return ModelViewer(
            src: snapshot.data ?? "https://modelviewer.dev/shared-assets/models/Astronaut.glb", // Use the fetched 3D model URL
            alt: 'Your 3D Model',
            autoRotate: true,
            cameraControls: true,
          );
        } else {
          return Text('No 3D model URL available');
        }
      },
    );
  }

}
