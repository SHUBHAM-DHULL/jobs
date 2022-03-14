// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:web_firebase/pages/forgot_passward.dart';
import 'package:web_firebase/pages/signup.dart';
import 'package:web_firebase/pages/user/user_main.dart';
// import 'package:flutter_fb_auth_emailpass/pages/forgot_password.dart';
// import 'package:flutter_fb_auth_emailpass/pages/signup.dart';
// import 'package:flutter_fb_auth_emailpass/pages/user/user_main.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // code for check user register or note
  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => UserMain()));
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        print('no user foud');
      }
      print(e);
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Login"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Email: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Email';
                    } else if (!value.contains('@')) {
                      return 'Please Enter Valid Email';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            email = emailController.text;
                            password = passwordController.text;
                          });
                          userLogin();
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    TextButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPassword(),
                          ),
                        )
                      },
                      child: Text(
                        'Forgot Password ?',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account? "),
                    TextButton(
                      onPressed: () => {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => Signup(),
                              transitionDuration: Duration(seconds: 0),
                            ),
                            (route) => false)
                      },
                      child: Text('Signup'),
                    ),
                    // TextButton(
                    //   onPressed: () => {
                    //     Navigator.pushAndRemoveUntil(
                    //         context,
                    //         PageRouteBuilder(
                    //           pageBuilder: (context, a, b) => UserMain(),
                    //           transitionDuration: Duration(seconds: 0),
                    //         ),
                    //         (route) => false)
                    //   },
                    //   child: Text('Dashboard'),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// class _loginState extends State<login> {
//   String? insta_passward;
//   String? insta_gmail;
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   TextEditingController _passward = TextEditingController();
//   TextEditingController _email = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           color: Colors.white10,
//           child: Center(
//             child: Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 70,
//                   ),
//                   Container(
//                     height: 400,
//                     width: 450,
//                     child: Card(
//                       // shadowColor: Colors.white10,
//                       color: Colors.white,
//                       child: Column(
//                         // ignore: prefer_const_literals_to_create_immutables
//                         children: [
//                           SizedBox(
//                             height: 80,
//                             child: Container(
//                               padding: EdgeInsets.symmetric(horizontal: 40),
//                               child: Image.asset('images/instagram.jpg'),
//                               // color: Colors.cyan,
//                             ),
//                           ),
//                           // Image.asset('images/instagram.jpg'),
//                           SizedBox(height: 20),
//                           Container(
//                             color: Colors.white10,
//                             width: 380,
//                             // height: 400,
//                             child: Column(
//                               // ignore: prefer_const_literals_to_create_immutables
//                               children: [
//                                 // 1st textfield
//                                 SizedBox(
//                                   height: 40,
//                                   child: TextField(
//                                     controller: _email,
//                                     decoration: InputDecoration(
//                                       border: OutlineInputBorder(),
//                                       hintText: 'phone number,email,user name ',
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 15),
//                                 // 2nd text field
//                                 SizedBox(
//                                   height: 40,
//                                   child: TextField(
//                                     controller: _passward,
//                                     style: TextStyle(),
//                                     decoration: InputDecoration(
//                                         border: OutlineInputBorder(),
//                                         hintText: ('Passward')),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Container(
//                                   color: Colors.lightBlue[200],
//                                   child: TextButton(
//                                       onPressed: () {
//                                         setState(() {
//                                           insta_gmail = _email.text;
//                                           insta_passward = _passward.text;
//                                         });
//                                         _firestore
//                                             .collection('user')
//                                             .add({
//                                               'id': insta_gmail,
//                                               'passward': insta_passward
//                                             })
//                                             .then((value) => print('upload'))
//                                             .catchError((e) {
//                                               print(e);
//                                             });
//                                       },
//                                       child: Center(
//                                         child: Text(
//                                           'Log In',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w900,
//                                               fontSize: 17,
//                                               color: Colors.white),
//                                         ),
//                                       )),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Text('OR'),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   // ignore: prefer_const_literals_to_create_immutables
//                                   children: [
//                                     Icon(
//                                       Icons.facebook,
//                                       color: Colors.blue,
//                                     ),
//                                     Text('  Log in with Facebook')
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Text('Forgot passward ?')
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Container(
//                     height: 50,
//                     width: 450,
//                     // color: Colors.amberAccent,
//                     child: Card(
//                       child: Center(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           // ignore: prefer_const_literals_to_create_immutables
//                           children: [
//                             Text("Don't have account?"),
//                             Text(
//                               "Sign up",
//                               style: TextStyle(color: Colors.blue),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text('Get the app.'),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: 180,
//                         height: 50,
//                         color: Colors.black,
//                         child: Row(
//                           // ignore: prefer_const_literals_to_create_immutables
//                           children: [
//                             Icon(
//                               Icons.apple,
//                               color: Colors.white,
//                               size: 55,
//                             ),
//                             Column(
//                               // ignore: prefer_const_literals_to_create_immutables
//                               children: [
//                                 Text(
//                                   'Downlod on the',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 Text(
//                                   'App Store',
//                                   style: TextStyle(
//                                       fontSize: 25, color: Colors.white),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: 25,
//                       ),
//                       Container(
//                         width: 180,
//                         height: 50,
//                         color: Colors.black,
//                         child: Row(
//                           // ignore: prefer_const_literals_to_create_immutables
//                           children: [
//                             Icon(
//                               Icons.gamepad,
//                               color: Colors.white,
//                               size: 55,
//                             ),
//                             Column(
//                               // ignore: prefer_const_literals_to_create_immutables
//                               children: [
//                                 Text(
//                                   'Downlod on the',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 Text(
//                                   'App Store',
//                                   style: TextStyle(
//                                       fontSize: 25, color: Colors.white),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }