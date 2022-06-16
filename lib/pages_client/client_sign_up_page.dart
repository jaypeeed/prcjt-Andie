import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prjct_andie/testing/services(sign_in)/auth_services.dart';
import 'package:provider/provider.dart';
import '../Recycle Bin/andie_sign_up_page3.dart';

// void main() {
//   runApp(const MaterialApp(home: SignUpClient()));
// }

class SignUpClient extends StatefulWidget {
  const SignUpClient({Key? key}) : super(key: key);

  @override
  State<SignUpClient> createState() => _SignUpClientState();
}

var pendingAndies = [];
var finalAndies = [];
var historyAndies = [];
int report = 0;

class _SignUpClientState extends State<SignUpClient> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController numberController = new TextEditingController();
  TextEditingController genderController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController fbController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String age = '';
  String number = '';
  String gender = '';
  String name = '';
  String fb = '';

  List<String> items = [
    'Male',
    'Female',
  ];
  String? selectedItem = 'Male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/background1.png'),
          fit: BoxFit.cover,
        )),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              //------ Left Side -------
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 50.0),
                //color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: const Image(
                            image: AssetImage(
                              'assets/andie_logo.png',
                            ),
                            width: 200,
                            height: 60,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 90, left: 20),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 75,
                                        color: Colors.white,
                                        letterSpacing: 3,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 4.0,
                                            color:
                                                Colors.black.withOpacity(.25),
                                            offset: const Offset(0.0, 4.0),
                                          ),
                                        ]),
                                    children: [
                                  TextSpan(
                                    style: GoogleFonts.inter(),
                                    text: "NEED HELP?\nHIRE AN\n",
                                  ),
                                  const TextSpan(
                                    text: 'ANDIE!',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  )
                                ])),
                            Container(
                              margin: const EdgeInsets.only(top: 30, left: 30),
                              child: const Text(
                                'It is easier to connect with them\nwhen you have an account!',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 35,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ------------------Right Pane Configurations-------------------

            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: const AssetImage('spin_gear.gif'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.1), BlendMode.dstATop),
                  ),
                ),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 10,
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 10),
                            child: const Text(
                              'Sign Up as CLIENT!',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 5, left: 40, right: 40),
                          child: TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                if (value.length < 6) {
                                  return 'Use your complete name';
                                } else {
                                  return null;
                                }
                              } else {
                                return "Empty input";
                              }
                            },
                            decoration: const InputDecoration(
                                hintText: 'Name',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey))),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 5, left: 40, right: 40),
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                if (value.contains('@') &&
                                    value.contains('.com')) {
                                  return null;
                                } else {
                                  return 'Not a valid email';
                                }
                              } else {
                                return "Empty/Invalid Email";
                              }
                            },
                            decoration: const InputDecoration(
                                hintText: 'Email',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey))),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 15, left: 40, right: 40),
                          child: TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                if (value.length < 6) {
                                  return 'Password is too short';
                                } else {
                                  return null;
                                }
                              } else {
                                return "Empty/Invalid Password";
                              }
                            },
                            decoration: const InputDecoration(
                                hintText: 'Password',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey))),
                            obscureText: true,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          margin: const EdgeInsets.only(top: 5, left: 45),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 48,
                                  child: DropdownButtonFormField<String>(
                                    dropdownColor: Colors.white,
                                    value: selectedItem,
                                    items: items
                                        .map((item) => DropdownMenuItem(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            )))
                                        .toList(),
                                    onChanged: (item) =>
                                        setState(() => selectedItem = item),
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 5, left: 40, right: 40),
                                    child: TextFormField(
                                      controller: ageController,
                                      validator: (value) {
                                        if (value!.isNotEmpty) {
                                          if (value.contains('-') ||
                                              value == '1' ||
                                              value == '2' ||
                                              value == '3' ||
                                              value == '4' ||
                                              value == '5' ||
                                              value == '6' ||
                                              value == '7' ||
                                              value == '8' ||
                                              value == '9' ||
                                              value == '10' ||
                                              value == '11' ||
                                              value == '12' ||
                                              value == '13' ||
                                              value == '14' ||
                                              value == '15' ||
                                              value == '16' ||
                                              value == '17') {
                                            return 'You must be 18 or above';
                                          } else {
                                            return null;
                                          }
                                        } else {
                                          return "Empty input";
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Age',
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 5, left: 40, right: 40),
                          child: TextFormField(
                            controller: numberController,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                if (value.length < 10) {
                                  return 'Invalid Phone No.';
                                } else {
                                  return null;
                                }
                              } else {
                                return "Empty input";
                              }
                            },
                            decoration: const InputDecoration(
                                hintText: 'Phone Number',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey))),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 5, left: 40, right: 40),
                          child: TextFormField(
                            controller: fbController,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                if (value.contains('.com')) {
                                  return null;
                                } else {
                                  return 'Not a valid FB link';
                                }
                              } else {
                                return "Empty";
                              }
                            },
                            decoration: const InputDecoration(
                                hintText: 'Facebook Link',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey))),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 1, left: 40, right: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  final String email =
                                      emailController.text.trim();
                                  final String password =
                                      passwordController.text.trim();

                                  final String age = ageController.text.trim();
                                  final String number =
                                      numberController.text.trim();
                                  final String name =
                                      nameController.text.trim();
                                  final String fb = fbController.text.trim();

                                  if (_formkey.currentState!.validate()) {
                                    context
                                        .read<AuthServices>()
                                        .signUp(
                                          email,
                                          password,
                                        )
                                        .then((value) async {
                                      User? user =
                                          FirebaseAuth.instance.currentUser;

                                      await FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(user?.uid)
                                          .set({
                                        "uid": user?.uid,
                                        "email": email,
                                        "password": password,
                                        "age": age,
                                        "contNumber": number,
                                        "name": name,
                                        "fb": fb,
                                        'reportCount': report,
                                        "gender": selectedItem,
                                        "photo": "phto",
                                        "role": "user",
                                      });
                                    });
                                  }

                                  if (email.isEmpty) {
                                    print("Email is Empty");
                                  } else {
                                    if (password.isEmpty) {
                                      print("Password is Empty");
                                    } else {}
                                  }
                                },
                                icon: const Icon(
                                  Icons.arrow_circle_right_rounded,
                                  size: 40,
                                  color: Color.fromRGBO(137, 137, 137, 1.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // const Expanded(
                      //   flex: 10,
                      //   child: Center(
                      //     child: Text(
                      //       'or',
                      //       style: TextStyle(
                      //         fontSize: 25,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Expanded(
                      //   flex: 10,
                      //   child: Container(
                      //     margin: const EdgeInsets.only(
                      //         left: 40, right: 40, bottom: 30),
                      //     child: OutlinedButton(
                      //       onPressed: () {
                      //         Navigator.push(
                      //           context,
                      //           PageRouteBuilder(
                      //               pageBuilder: (BuildContext context,
                      //                       Animation animation,
                      //                       Animation secondaryAnimation) =>
                      //                   const AndieSignUp3(), //Change here to open Google Login
                      //               transitionDuration:
                      //                   const Duration(seconds: 0)),
                      //         );
                      //       },
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Container(
                      //             margin: const EdgeInsets.only(right: 20),
                      //             child: const Image(
                      //               image: const AssetImage(
                      //                 'assets/google.png',
                      //               ),
                      //               width: 20,
                      //               height: 20,
                      //             ),
                      //           ),
                      //           const Text(
                      //             'Sign Up Using Google',
                      //             style: const TextStyle(
                      //               fontWeight: FontWeight.bold,
                      //               color: Colors.black,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      // BUTTON FOR GOOGLE SIGN IN
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
