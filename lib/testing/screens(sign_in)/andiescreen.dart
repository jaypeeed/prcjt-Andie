import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services(sign_in)/auth_services.dart';

class AndieScreen extends StatefulWidget {
  const AndieScreen({Key? key}) : super(key: key);

  @override
  State<AndieScreen> createState() => _AndieScreenState();
}

class _AndieScreenState extends State<AndieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text("LOG OUT")),
          Text("ANDIE SCREEN"),
          SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
