import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prjct_andie/pages_client/client_menu.dart';
import 'package:prjct_andie/screens/home/home.dart';
import 'package:universal_html/html.dart' as html;
import 'package:prjct_andie/testing/screens(sign_in)/andiescreen.dart';
import 'package:prjct_andie/testing/screens(sign_in)/homescreen.dart';

import '../../pages_admin/admin_home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String role = "user";

  @override
  void initState() {
    super.initState();
    _checkRole();
  }

  void _checkRole() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get();
    setState(() {
      role = snap['role'];
    });

    if (role == 'user') {
      navigateNext(ClientMenu());
    } else if (role == 'andie') {
      navigateNext(Home());
    } else if (role == 'admin') {
      navigateNext(AdminHome());
    }
  }

  void navigateNext(Widget route) {
    Timer(Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => route));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 205, 84, 1.0),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/andie_logo.png',
                )),
            Expanded(
                flex: 5,
                child: Image.asset(
                  'andie_splash_screen.gif',
                )),
          ],
        ),
      ),
    );
  }
}
