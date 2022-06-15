import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prjct_andie/testing/services(sign_in)/auth_services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("LOGIN / SIGN UP"),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Empty/Invalid email";
                  }
                },
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "EMAIL...",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0),
              child: TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Empty/Invalid email";
                  }
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "PASSWORD...",
                ),
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  final String email = emailController.text.trim();
                  final String password = passwordController.text.trim();

                  if (email.isEmpty) {
                    print("Email is Empty");
                  } else {
                    if (password.isEmpty) {
                      print("Password is Empty");
                    } else {
                      context.read<AuthServices>().login(email, password);
                    }
                  }
                },
                child: Text("LOG IN"),
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {
                  final String email = emailController.text.trim();
                  final String password = passwordController.text.trim();

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
                        User? user = FirebaseAuth.instance.currentUser;

                        await FirebaseFirestore.instance
                            .collection("Client")
                            .doc(user?.uid)
                            .set({
                          "uid": user?.uid,
                          "email": email,
                          "password": password,
                          "name": "name",
                          "contactNumber": "number nimo",
                          "photo": "photo",
                          "role": "client",
                        });
                      });
                    }
                  }
                },
                child: Text("SIGN UP AS CLIENT"),
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {
                  final String email = emailController.text.trim();
                  final String password = passwordController.text.trim();

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
                        User? user = FirebaseAuth.instance.currentUser;

                        await FirebaseFirestore.instance
                            .collection("Andie")
                            .doc(user?.uid)
                            .set({
                          "uid": user?.uid,
                          "email": email,
                          "password": password,
                          "name": "name",
                          "contactNumber": "number",
                          "skills": "skills",
                          "experience": "experiences",
                          "school": "school",
                          "yearsOfWork": "years",
                          "photo": "photo",
                          "ratings": "rating",
                          "role": "andie",
                        });
                      });
                    }
                  }
                },
                child: Text("SIGN UP AS ANDIE"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
