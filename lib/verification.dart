// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_unnecessary_containers, prefer_final_fields
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';

class verification extends StatefulWidget {
  const verification({Key? key}) : super(key: key);

  @override
  _verificationState createState() => _verificationState();
}

class _verificationState extends State<verification> {
  bool res = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  EmailAuth emailAuth = EmailAuth(sessionName: "smaple session");
  @override
  bool subbmit_validate = false;
  TextEditingController _email = TextEditingController();
  TextEditingController _otpcontroller = TextEditingController();
  TextEditingController _passward = TextEditingController();
  TextEditingController _confirmpassward = TextEditingController();
  void verifiotp() {
    res = emailAuth.validateOtp(
        recipientMail: _email.value.text, userOtp: _otpcontroller.value.text);
    if (res) {
      print('otp verified');
    } else
      print('enter wrong otp');
  }

  void sendotp() async {
    bool result =
        await emailAuth.sendOtp(recipientMail: _email.value.text, otpLength: 5);
    if (result) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('otp sent sucess fully')));
      subbmit_validate = true;
    } else
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('email enter you is in correct')));
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
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
                            Row(
                              children: [
                                Container(
                                  width: 380,
                                  child: Column(children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      child: TextFormField(
                                        controller: _email,
                                        scrollPadding: EdgeInsets.all(16),
                                        decoration: InputDecoration(
                                            hintText: "enter email",
                                            labelText: "enter email",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(27)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(27))),
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return 'required';
                                          } else
                                            return null;
                                        },
                                      ),
                                    ),
                                  ]),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  width: 110,
                                  child: Center(
                                    child: TextButton(
                                        onPressed: () {
                                          sendotp();
                                        },
                                        child: Text('sent otp')),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: TextFormField(
                                controller: _otpcontroller,
                                scrollPadding: EdgeInsets.all(16),
                                validator: (val) {
                                  verifiotp();
                                  if (val!.length < 5) {
                                    return 'enter correct otp';
                                  } else if (res == false) {
                                    return 'enter wrong otp';
                                  }
                                },
                                decoration: InputDecoration(
                                    hintText: "verifotp",
                                    labelText: "verifi otp",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(27)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(27))),
                              ),
                            ),
                            // create passward
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: TextFormField(
                                controller: _passward,
                                scrollPadding: EdgeInsets.all(16),
                                validator: (val) {
                                  if (val!.length < 6) {
                                    return 'passward length minimum 6';
                                  }
                                },
                                decoration: InputDecoration(
                                    hintText: "enter passward",
                                    labelText: "enter passward",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(27)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(27))),
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(vertical: 8),
                            //   child: TextFormField(
                            //     controller: _confirmpassward,
                            //     scrollPadding: EdgeInsets.all(16),
                            //     validator: (val) {
                            //       if (val == _passward) {
                            //         return null;
                            //       } else
                            //         return 'passward not match with confirm passward';
                            //     },
                            //     decoration: InputDecoration(
                            //         hintText: "confirm passward",
                            //         labelText: "confirm passward",
                            //         border: OutlineInputBorder(
                            //             borderRadius:
                            //                 BorderRadius.circular(27)),
                            //         focusedBorder: OutlineInputBorder(
                            //             borderSide: BorderSide(
                            //                 color: Colors.black, width: 2),
                            //             borderRadius:
                            //                 BorderRadius.circular(27))),
                            //   ),
                            // ),
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
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                try {
                                  await _auth.createUserWithEmailAndPassword(
                                      email: _email.text,
                                      password: _passward.text);
                                  Navigator.pop(context);
                                } catch (e) {
                                  print(e);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Recheck detail you enter  /  uresr already exist')));
                                }
                              }
                            },
                            child: Text("Register",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 27,
                                    color: Colors.black))),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget verify(String name) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(vertical: 8),
  //     child: TextField(
  //       scrollPadding: EdgeInsets.all(16),
  //       decoration: InputDecoration(
  //           hintText: "$name",
  //           labelText: "$name",
  //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(27)),
  //           focusedBorder: OutlineInputBorder(
  //               borderSide: BorderSide(color: Colors.black, width: 2),
  //               borderRadius: BorderRadius.circular(27))),
  //     ),
  //   );
  // }
}
