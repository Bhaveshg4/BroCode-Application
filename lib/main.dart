import 'package:bro_code_02/Routes.dart';
import 'package:bro_code_02/leave.dart';
import 'package:bro_code_02/main_cloth.dart';
import 'package:bro_code_02/present_homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: main_cloth(),
      routes: {
        MyRoutes.leaveRoute: (context) => Leavepage(),
        MyRoutes.presentRoute: (context) => present(),
        MyRoutes.loginRoute: (context) => main_cloth()
      },
    );
  }
}
