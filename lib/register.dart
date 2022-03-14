// ignore_for_file: camel_case_types, prefer_const_constructors, curly_braces_in_flow_control_structures, sized_box_for_whitespace, avoid_unnecessary_containers, unnecessary_string_interpolations, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  String? uid = FirebaseAuth.instance.currentUser!.email;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _father_name = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _mobile_no = TextEditingController();
  TextEditingController _whatsapp_no = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _pincode = TextEditingController();
  // education detail
  // 10
  TextEditingController _10_school_name = TextEditingController();
  TextEditingController _10_board = TextEditingController();
  TextEditingController _10_marks = TextEditingController();
  // 12
  TextEditingController _12_school_name = TextEditingController();
  TextEditingController _12_board = TextEditingController();
  TextEditingController _12_stream = TextEditingController();
  TextEditingController _12_marks = TextEditingController();
  // graducation
  TextEditingController _college_name_ug = TextEditingController();
  TextEditingController _college_stream_ug = TextEditingController();
  TextEditingController _college_marks_ug = TextEditingController();
  // post graducation
  TextEditingController _college_name_pg = TextEditingController();
  TextEditingController _college_stream_pg = TextEditingController();
  TextEditingController _college_marks_pg = TextEditingController();

  GlobalKey<FormState> _formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formstate,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        color: Colors.black38,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              // ignore: prefer_const_literals_to_create_immutables
                            ),
                            width: 700,
                            height: 770,
                            child: Card(
                              child: SingleChildScrollView(
                                child: Center(
                                  child: Column(
                                    // ignore: prefer_const_literals_to_create_immutables

                                    children: [
                                      SizedBox(
                                        height: 120,
                                        child: Center(
                                          child: Text(
                                            "Personal detail",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                color: Colors.blueAccent,
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
                                                  width: 245,
                                                  child: Column(
                                                    children: [
                                                      data('first name',
                                                          _firstname)
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Container(
                                                    width: 245,
                                                    child: data(
                                                        'Last name', _lastname))
                                              ],
                                            ),
                                            data('Father name', _father_name),
                                            data('Gender', _gender),
                                            data('age', _age),
                                            data('Mobile no.', _mobile_no),
                                            data('Whatsapp no.', _whatsapp_no),
                                            data('current address', _address),
                                            data('Pin Code', _pincode)
                                          ],
                                        ),
                                      ),
                                      //
                                      SizedBox(
                                        height: 35,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlueAccent,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          // ignore: prefer_const_literals_to_create_immutables
                                        ),
                                        // child: TextButton(
                                        //     onPressed: () {},
                                        //     child: Text("  Next  ",
                                        //         style: TextStyle(
                                        //             fontWeight: FontWeight.w900,
                                        //             fontSize: 27,
                                        //             color: Colors.black))),
                                      ),
                                      SizedBox(height: 50),
                                      // Container(
                                      //   child: Row(
                                      //     children: [
                                      //       Column(
                                      //         children: [verify('Enter email')],
                                      //       ),
                                      //       TextButton(onPressed: () {}, child: Text("verifi"))
                                      //     ],
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        color: Colors.black38,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              // ignore: prefer_const_literals_to_create_immutables
                            ),
                            width: 600,
                            child: Card(
                              child: Center(
                                child: Column(
                                  // ignore: prefer_const_literals_to_create_immutables

                                  children: [
                                    SizedBox(
                                      height: 120,
                                      child: Center(
                                        child: Text(
                                          "Education detail",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              color: Colors.blueAccent,
                                              fontSize: 40,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                    ),
                                    // Text(
                                    //   "class 10",
                                    //   style: TextStyle(
                                    //       fontSize: 20,
                                    //       fontWeight: FontWeight.bold,
                                    //       color: Colors.red),
                                    // ),
                                    // data('School name', _10_school_name),
                                    // data('Board ', _10_board),
                                    // data('marks', _10_marks),
                                    Text(
                                      "class 12",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    data('School name', _12_school_name),
                                    data('Board ', _12_board),
                                    data('Stream', _12_stream),
                                    data('marks ', _12_marks),
                                    Text(
                                      "Graducation detail",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    data('college name/univercity name',
                                        _college_name_ug),
                                    data('Stream', _college_stream_ug),
                                    data('marks ', _college_marks_ug),
                                    Text(
                                      "about your self",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    data('about your sel', _college_marks_pg),
                                    // data('college name/univercity name',
                                    //     _college_name_pg),
                                    // data('Stream', _college_stream_pg),
                                    // data('marks ', _college_marks_pg),
                                    SizedBox(
                                      height: 35,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlueAccent,
                                        borderRadius: BorderRadius.circular(25),
                                        // ignore: prefer_const_literals_to_create_immutables
                                      ),
                                      // child: TextButton(
                                      //     onPressed: () {},
                                      //     child: Text("  Next  ",
                                      //         style: TextStyle(
                                      //             fontWeight: FontWeight.w900,
                                      //             fontSize: 27,
                                      //             color: Colors.black))),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (builder) => AlertDialog(
                                    content: Text('regiter sucessfully'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                          child: Text('OK'))
                                    ],
                                  ));
                          // AlertDialog(
                          //   title: Text('congratulations sucess fully submit'),
                          // );
                          // if (_formstate.currentState!.validate()) {
                          // _firestore.collection('user').doc('$uid').set({
                          //   'name': _firstname.text,
                          //   'last name': _lastname.text,
                          //   'Gender': _gender.text,
                          //   'Age': _age.text,
                          //   'Mobile no.': _mobile_no.text,
                          //   'whatsapp no.': _whatsapp_no.text,
                          //   'address ': _address.text,
                          //   '12 school name': _12_school_name.text,
                          //   '12 board': _12_board.text,
                          //   '12 stream': _12_stream.text,
                          //   '12 marks': _12_marks.text,
                          //   'college/univercity name': _college_name_ug.text,
                          //   'college/univercity stream': _college_marks_ug.text,
                          //   'college/univercity marks': _college_marks_ug.text,
                          //   'about your self': _college_marks_pg.text,
                          //   'PIN code': _pincode.text
                          // });
                          // Navigator.pop(context);
                          // }
                          // else
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //       content: Text('enter all the column')));
                        },
                        child: Text('subbmit')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      // Container(
      //   color: Colors.black38,
      //   child: Center(
      //     child: Container(
      //       decoration: BoxDecoration(
      //         color: Colors.black38,
      //         // ignore: prefer_const_literals_to_create_immutables
      //         boxShadow: [
      //           BoxShadow(
      //               color: Colors.lightBlueAccent,
      //               spreadRadius: 10,
      //               blurRadius: 12)
      //         ],
      //       ),
      //       height: 700,
      //       width: 700,
      //       child: Card(
      //         child: Center(
      //           child: Column(
      //             // ignore: prefer_const_literals_to_create_immutables

      //             children: [
      //               SizedBox(
      //                 height: 120,
      //                 child: Center(
      //                   child: Text(
      //                     "Enter detail",
      //                     style: TextStyle(
      //                         fontWeight: FontWeight.w900,
      //                         color: Colors.blueAccent,
      //                         fontSize: 40,
      //                         fontStyle: FontStyle.italic),
      //                   ),
      //                 ),
      //               ),
      //               Container(
      //                 width: 500,
      //                 child: Column(
      //                   children: [
      //                     Row(
      //                       children: [
      //                         Container(
      //                           width: 245,
      //                           child: Column(
      //                             children: [data('first email')],
      //                           ),
      //                         ),
      //                         SizedBox(width: 10),
      //                         Container(width: 245, child: data('Last name'))
      //                       ],
      //                     ),
      //                     // verify('enter create passward'),
      //                   ],
      //                 ),
      //               ),
      //               // class 12
      //               Container(
      //                 width: 500,
      //                 child: Column(
      //                   children: [
      //                     Row(
      //                       children: [
      //                         Container(
      //                           width: 245,
      //                           child: Column(
      //                             children: [data('class 12 mark')],
      //                           ),
      //                         ),
      //                         SizedBox(width: 10),
      //                         Container(width: 245, child: data('Stream'))
      //                       ],
      //                     ),
      //                     // verify('enter create passward'),
      //                   ],
      //                 ),
      //               ),
      //               // graduation marks
      //               Container(
      //                 width: 500,
      //                 child: Column(
      //                   children: [
      //                     Row(
      //                       children: [
      //                         Container(
      //                           width: 245,
      //                           child: Column(
      //                             children: [data('% in Graduation')],
      //                           ),
      //                         ),
      //                         SizedBox(width: 10),
      //                         Container(
      //                             width: 245, child: data('Gratuation stream'))
      //                       ],
      //                     ),
      //                     // verify('enter create passward'),
      //                   ],
      //                 ),
      //               ),
      //               // gender age
      //               Container(
      //                 width: 500,
      //                 child: Column(
      //                   children: [
      //                     Row(
      //                       children: [
      //                         Container(
      //                           width: 245,
      //                           child: Column(
      //                             children: [data('Gender')],
      //                           ),
      //                         ),
      //                         SizedBox(width: 10),
      //                         Container(width: 245, child: data('Age'))
      //                       ],
      //                     ),
      //                     // verify('enter create passward'),
      //                     data('experience'),
      //                     data('Your dought'),
      //                   ],
      //                 ),
      //               ),
      //               //
      //               SizedBox(
      //                 height: 35,
      //               ),
      //               Container(
      //                 decoration: BoxDecoration(
      //                   color: Colors.lightBlueAccent,
      //                   borderRadius: BorderRadius.circular(25),
      //                   // ignore: prefer_const_literals_to_create_immutables
      //                   boxShadow: [
      //                     BoxShadow(
      //                       color: Colors.grey,
      //                       spreadRadius: 10,
      //                       blurRadius: 12,
      //                     ),
      //                   ],
      //                 ),
      //                 child: TextButton(
      //                     onPressed: () {},
      //                     child: Text("subbmit",
      //                         style: TextStyle(
      //                             fontWeight: FontWeight.w900,
      //                             fontSize: 27,
      //                             color: Colors.black))),
      //               )
      //               // Container(
      //               //   child: Row(
      //               //     children: [
      //               //       Column(
      //               //         children: [verify('Enter email')],
      //               //       ),
      //               //       TextButton(onPressed: () {}, child: Text("verifi"))
      //               //     ],
      //               //   ),
      //               // ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Widget data(String name, TextEditingController _controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: _controller,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Fill the given parameter';
          }
          return 'error';
        },
        scrollPadding: EdgeInsets.all(16),
        decoration: InputDecoration(
            hintText: "$name",
            labelText: "$name",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(27)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(27))),
      ),
    );
  }
}

// class firsthalf extends StatefulWidget {
//   const firsthalf({Key? key}) : super(key: key);

//   @override
//   _firsthalfState createState() => _firsthalfState();
// }

// class _firsthalfState extends State<firsthalf> {

//   @override
//   Widget build(BuildContext context) {
//     return;
//   }
// }
// for personal detail
/*

Container(
            color: Colors.black38,
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
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables

                        children: [
                          SizedBox(
                            height: 120,
                            child: Center(
                              child: Text(
                                "Personal detail",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.blueAccent,
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
                                      width: 245,
                                      child: Column(
                                        children: [
                                          data('first name', _firstname)
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                        width: 245,
                                        child: data('Last name', _lastname))
                                  ],
                                ),
                                data('Father name', _father_name),
                                data('Gender', _gender),
                                data('age', _age),
                                data('Mobile no.', _mobile_no),
                                data('Whatsapp no.', _whatsapp_no),
                                data('current address', _address),
                                data('Pin Code', _pincode)
                              ],
                            ),
                          ),
                          //
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
                                onPressed: () {},
                                child: Text("  Next  ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 27,
                                        color: Colors.black))),
                          ),
                          SizedBox(height: 50),
                          // Container(
                          //   child: Row(
                          //     children: [
                          //       Column(
                          //         children: [verify('Enter email')],
                          //       ),
                          //       TextButton(onPressed: () {}, child: Text("verifi"))
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
 */
/*
Container(
            color: Colors.black38,
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
                    child: SingleChildScrollView(
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables

                        children: [
                          SizedBox(
                            height: 120,
                            child: Center(
                              child: Text(
                                "Education detail",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.blueAccent,
                                    fontSize: 40,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                          Text(
                            "class 10",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          data('School name', _10_school_name),
                          data('Board ', _10_board),
                          data('marks', _10_marks),
                          Text(
                            "class 12",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          data('School name', _12_school_name),
                          data('Board ', _12_board),
                          data('Stream', _12_stream),
                          data('marks ', _12_marks),
                          Text(
                            "Graducation detail",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          data(
                              'college name/univercity name', _college_name_ug),
                          data('Stream', _college_stream_ug),
                          data('marks ', _college_marks_ug),
                          Text(
                            "Post Graducation",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          data(
                              'college name/univercity name', _college_name_pg),
                          data('Stream', _college_stream_pg),
                          data('marks ', _college_marks_pg),
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
                                onPressed: () {},
                                child: Text("  Next  ",
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
 */