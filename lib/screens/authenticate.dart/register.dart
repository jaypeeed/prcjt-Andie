import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prjct_andie/services/auth.dart';
import 'package:prjct_andie/testing/services(sign_in)/auth_services.dart';
import 'package:provider/provider.dart';

import '../../checkbox/checkbox_state.dart';
import '../../pages/andie_sign_up_page3.dart';
import '../../pages_client/client_sign_up_page.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final notifications = [
    CheckBoxState(title: 'PANDAY'),
    CheckBoxState(title: 'PLUMBER'),
    CheckBoxState(title: 'PAINTER'),
    CheckBoxState(title: 'GARDENER'),
    CheckBoxState(title: 'COOK'),
    CheckBoxState(title: 'TECHNICIAN'),
    CheckBoxState(title: 'ELECTRICIAN'),
    CheckBoxState(title: 'PLUMBER'),
    CheckBoxState(title: 'HOUSE KEEPER'),
    CheckBoxState(title: 'LAUNDERER'),
  ];

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/background1.png'),
        fit: BoxFit.cover,
      )),
      child: Column(
        children: [
          //------this is the app bar------
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.green,
                child: const SizedBox(
                  width: 5,
                ),
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
              Expanded(
                flex: 10,
                child: Center(
                    child: ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () {},
                )),
                /* SizedBox(
                        width: 20,
                        height: 20,
                      ),*/
              )
            ],
          ),
          Expanded(
            flex: 100,
            child: Container(
              height: 500,
              width: 1500,
              margin: const EdgeInsets.fromLTRB(40, 30, 40, 30),
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          // color: Colors.green,
                          child: const Text(
                            'Sign Up As ANDIE',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 50,
                            child: SizedBox(
                              width: 10,
                            )),
                        Expanded(
                          flex: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                              ),
                            ),
                            margin: const EdgeInsets.only(right: 20),
                            child: TextButton(
                              child: const Text(
                                'Sign Up As CLIENT??',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (BuildContext context,
                                              Animation animation,
                                              Animation secondaryAnimation) =>
                                          const SignUpClient(), //Change here to open Google Login
                                      transitionDuration:
                                          const Duration(seconds: 0)),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      // color: Colors.green,
                      //padding: const EdgeInsets.only(left: 400, right: 400),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: <Widget>[
                                const SizedBox(height: 20.0),
                                TextFormField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                      hintText: 'Email',
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey))),
                                ),
                                const SizedBox(height: 20.0),
                                TextFormField(
                                  controller: passwordController,
                                  decoration: const InputDecoration(
                                      hintText: 'Password',
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey))),
                                  obscureText: true,
                                ),
                                const SizedBox(height: 20.0),
                                const SizedBox(height: 12.0),
                                Text(
                                  error,
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 14.0),
                                )
                              ],
                            ),
                          ),
                          const Expanded(
                              flex: 5,
                              child: SizedBox(
                                width: 20,
                              ))
                        ],
                      ),
                    ),
                    //----------------------------------------
                    Container(
                      // color: Colors.green,
                      child: const Text(
                        'Skills',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10, left: 20),
                        //color: Colors.pink,
                        child: const Text(
                          'Select the skill/s that best decribes your Talents and Capabilities',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      //   color: Colors.blue,
                      width: 1200,
                      height: 180,
                      child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 10,
                          crossAxisSpacing: 50,
                          mainAxisSpacing: 10,
                        ),
                        children: [
                          ...notifications.map(buildSingleCheckBox).toList(),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      //   color: Colors.green,
                      child: const Text(
                        'BIO',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10, left: 20),
                        //   color: Colors.pink,
                        child: const Text(
                          'Hey ANDIE! Let us write your Bio! This will help us easily create your Profile Menu!',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 20, right: 25),
                      //color: Colors.green,
                      child: const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText:
                              'Do you have any work experience/s? Explain it to us!',
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 20, right: 25),
                      //color: Colors.green,
                      child: const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText:
                              'Did you go to any Technical Schools (ie. TESDA), Self- Taught, or something else?',
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 20, right: 25),
                      //color: Colors.green,
                      child: const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'How long have you been in this Industry?',
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        // color: Colors.red,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.orangeAccent),
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              final String email = emailController.text.trim();
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
                                      "role": "andie",
                                    });
                                  });
                                }
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    )

        /*Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                  )
                ),
                  validator: (val) => val!.isEmpty ? 'Enter your email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Password',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                      )
                  ),
                  validator: (val) => val!.length < 6
                      ? 'Enter your password with 6 chars long'
                      : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              SizedBox(height: 20.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() => error = 'Please supply a valid email');
                      }
                    }
                  }),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),*/
        );
  }

  Widget buildSingleCheckBox(CheckBoxState checkbox) => CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.orangeAccent,
        value: checkbox.value,
        title: Text(
          checkbox.title,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        onChanged: (value) => setState(() => checkbox.value = value!),
      );
}
