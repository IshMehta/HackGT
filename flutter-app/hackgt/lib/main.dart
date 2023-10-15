import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgt/camera.dart';
import 'package:dartssh2/dartssh2.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:file_picker/file_picker.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'HackGT APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'HackGT Project'),
      home:
      //ModelViewer

      // Scaffold(
      //  appBar: AppBar(title: const Text('Model Viewer')),
      //   body: const ModelViewer(
      //     backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
      //     src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
      //     alt: 'A 3D model of an astronaut',
      //     ar: true,
      //     arModes: ['scene-viewer', 'webxr', 'quick-look'],
      //     autoRotate: true,
      //     iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
      //     disableZoom: true,
      //   ),
      // ),


       MyHomePage(title: 'HackGT Project')


      );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final storage = FirebaseStorage.instanceFor(bucket: "gs://hackgt-5b60a.appspot.com");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const Center(
          child: Text(
            'Record the object here',
            style: TextStyle(fontSize: 20),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            FloatingActionButton.extended(
              onPressed:() async {
            //CAMERA USE

              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => const CameraPage()));
            // },
            // label: const Text('Start'),


            //SSH USE TEST

            // final socket = await SSHSocket.connect('172.16.12.159', 22);
            // final client = SSHClient(socket,
            //   username: "ish",
            //   onPasswordRequest: () => 'coco',
            // );
            // final uptime = await client.run('ls');
            // print(utf8.decode(uptime));
            //
            // client.close();
            // await client.done;



            //FIREBASE TEST
            // Create a storage reference from our app
            // final storageRef = FirebaseStorage.instance.ref();
            //
            // // Create a reference to "mountains.jpg"
            // final mountainsRef = storageRef.child("mountains.jpg");
            //
            // // Directory appDocDir = await getApplicationDocumentsDirectory();
            // // String filePath = '${appDocDir.absolute}/shrang.png';
            // File file = File("C:/Users/saara/StudioProjects/hackgt/lib/shrang.png");
            // await mountainsRef.putFile(file);
          },
          label: const Text('Start Camera')
        ),
        FloatingActionButton.extended(
        onPressed: ()async{
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null) {
            String fileName = result.files.first.name;
            String? filePath = result.files.first.path;
            File file = File(filePath!);

            // Upload file
            await FirebaseStorage.instance.ref('uploads/$fileName').putFile(file);
          }

    },
        label: const Text('Choose File from Device')
    ),
    ]
    )
    );
  }
}



