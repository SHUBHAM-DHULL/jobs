// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  String? email = FirebaseAuth.instance.currentUser!.email;
  DateTime? creationtime =
      FirebaseAuth.instance.currentUser!.metadata.creationTime;
  User? user = FirebaseAuth.instance.currentUser;
  verifiedemail() async {
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.orange,
        content: Text('verification send'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
          Text(
            'User ID: $uid',
            style: TextStyle(fontSize: 18.0),
          ),
          Row(
            children: [
              Text(
                'Email: $email',
                style: TextStyle(fontSize: 18.0),
              ),
              user!.emailVerified
                  ? Text('  verfied')
                  : TextButton(
                      onPressed: () => {
                            verifiedemail(),
                          },
                      child: Text('Verify Email'))
            ],
          ),
          Text(
            'Created: $creationtime',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
