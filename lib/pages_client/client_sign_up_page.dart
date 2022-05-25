import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prjct_andie/testing/services(sign_in)/auth_services.dart';
import 'package:provider/provider.dart';

import '../pages/andie_sign_up_page2.dart';
import '../pages/andie_sign_up_page3.dart';
import 'client_menu.dart';

// void main() {
//   runApp(const MaterialApp(home: SignUpClient()));
// }

class SignUpClient extends StatefulWidget {
  const SignUpClient({Key? key}) : super(key: key);

  @override
  State<SignUpClient> createState() => _SignUpClientState();
}

class _SignUpClientState extends State<SignUpClient> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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
              child: Container(
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            // color: Colors.cyanAccent,
                            child: const Image(
                              image: AssetImage(
                                'assets/andie_logo.png',
                              ),
                              width: 500,
                              height: 60,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (BuildContext context,
                                          Animation animation,
                                          Animation secondaryAnimation) =>
                                      const ClientMenu(),
                                  transitionDuration:
                                      const Duration(seconds: 0)),
                            );
                          },
                          child: const Text('DONE SIGN UP'),
                        ),
                        const Expanded(
                          flex: 5,
                          child: SizedBox(
                            width: 20,
                            height: 20,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      flex: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                              flex: 5,
                              child: SizedBox(
                                width: 20,
                                height: 20,
                              )),
                          const Expanded(
                            flex: 50,
                            child: Text(
                              'NEED HELP\nHIRE AN\nANDIE!',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 80,
                                  color: Colors.white),
                            ),
                          ),
                          Expanded(
                            flex: 50,
                            child: Container(
                              margin: const EdgeInsets.only(top: 25),
                              child: const Text(
                                'It is easier to connect with them\nwhen you have an account!',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 35,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
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
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
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
                            'Sign-Up as CLIENT!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 5, left: 40, right: 40),
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              hintText: 'Email',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 15, left: 40, right: 40),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                              hintText: 'Password',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey))),
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
                                  dropdownColor: Colors.orange[300],
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
                                  child: const TextField(
                                    decoration: InputDecoration(
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
                        margin:
                            const EdgeInsets.only(top: 15, left: 40, right: 40),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Contact Number',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 1, left: 40, right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                final String email =
                                    emailController.text.trim();
                                final String password =
                                    passwordController.text.trim();

                                if (email.isEmpty) {
                                  print("Email is Empty");
                                } else {
                                  if (password.isEmpty) {
                                    print("Password is Empty");
                                  } else {
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
                                        "role": "user",
                                      });
                                    });
                                  }
                                }
                              },
                              icon: const Icon(
                                Icons.arrow_circle_right_rounded,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 10,
                      child: Center(
                        child: Text(
                          'or',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 40, right: 40, bottom: 30),
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (BuildContext context,
                                          Animation animation,
                                          Animation secondaryAnimation) =>
                                      const AndieSignUp3(), //Change here to open Google Login
                                  transitionDuration:
                                      const Duration(seconds: 0)),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                child: const Image(
                                  image: const AssetImage(
                                    'assets/google.png',
                                  ),
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              const Text(
                                'Sign Up Using Google',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // BUTTON FOR GOOGLE SIGN IN
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
