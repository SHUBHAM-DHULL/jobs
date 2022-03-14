// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:web_firebase/singup.dart';

class authantication extends StatefulWidget {
  const authantication({Key? key}) : super(key: key);

  @override
  _authanticationState createState() => _authanticationState();
}

class _authanticationState extends State<authantication> {
  String? _email;
  String? passward;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/photo.png'), fit: BoxFit.fitWidth),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black38,
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                BoxShadow(
                    color: Colors.lightBlueAccent,
                    spreadRadius: 10,
                    blurRadius: 12)
              ],
            ),
            height: 700,
            width: 700,
            child: Card(
              child: Center(
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables

                  children: [
                    SizedBox(
                      height: 120,
                      child: Center(
                        child: Text(
                          "Registration",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontSize: 40,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    Container(
                      width: 500,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: TextField(
                              scrollPadding: EdgeInsets.all(16),
                              decoration: InputDecoration(
                                  hintText: "enter email",
                                  labelText: "email email",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(27)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2),
                                      borderRadius: BorderRadius.circular(27))),
                              onChanged: (value) {
                                setState(() {
                                  _email = value;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: TextField(
                              scrollPadding: EdgeInsets.all(16),
                              decoration: InputDecoration(
                                  hintText: "passward",
                                  labelText: "passward",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(27)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2),
                                      borderRadius: BorderRadius.circular(27))),
                              onChanged: (value) {
                                setState(() {
                                  passward = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(25),
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 10,
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("sign in",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 27,
                                  color: Colors.black))),
                    ),
                    SizedBox(height: 25),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(25),
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 10,
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => singup()));
                          },
                          child: Text("sign up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 27,
                                  color: Colors.black))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
