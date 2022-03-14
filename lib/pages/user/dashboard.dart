// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  User? user = FirebaseAuth.instance.currentUser;
  // String ?user_uid=user!.email;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController _name = TextEditingController();
  TextEditingController _sirname = TextEditingController();
  String? name;
  String? sirname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              TextField(
                controller: _name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'name'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _sirname,
                decoration: InputDecoration(
                  hintText: 'sirname',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      name = _name.text;
                      sirname = _sirname.text;
                    });
                    _firestore.collection('shubhamdhull676@gmail.com')
                        // .doc("shubhamdhull676@gmail.com")
                        .add({'name': name, 'sir name': sirname});
                    // add({'});
                  },
                  child: Text('enter data'))
            ],
          ),
        ),
      ),
    );
  }
}
