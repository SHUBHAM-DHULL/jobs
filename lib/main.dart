// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:web_firebase/homepage.dart';
import 'package:web_firebase/loginpage.dart';
import 'package:web_firebase/pages/login.dart';
import 'package:web_firebase/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyC7dRi56Co8HFilluY90LDUzO9whHTL8Po',
          appId: '1:191600828518:android:22226fbf1c376e1402cda7',
          messagingSenderId: '191600828518',
          projectId: 'fishing-5f241'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crud',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: LoginPage(),
      // home: register(),
    );
  }
}
