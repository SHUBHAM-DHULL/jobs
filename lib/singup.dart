// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:web_firebase/homepage.dart';

class singup extends StatefulWidget {
  const singup({Key? key}) : super(key: key);

  @override
  _singupState createState() => _singupState();
}

class _singupState extends State<singup> {
  final auth = FirebaseAuth.instance;
  String _email = '';
  String passward = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
              decoration: InputDecoration(
                label: Text('Enter email'),
              ),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              }),
          TextField(
              decoration: InputDecoration(
                label: Text('Enter passward'),
              ),
              onChanged: (value) {
                setState(() {
                  passward = value;
                });
              }),
          SizedBox(height: 25),
          TextButton(
            onPressed: () async {
              try {
                final newuser = await auth.createUserWithEmailAndPassword(
                    email: _email, password: passward);
                if (newuser != null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => homepage()));
                }
              } catch (e) {
                print(e);
              }
            },
            child: Icon(Icons.accessibility),
          )
        ],
      ),
    );
  }
}
