/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/andie_profile_andie.dart';
import '../services/auth.dart';

class AndieAppbar extends StatefulWidget {
  const AndieAppbar({Key? key}) : super(key: key);

  @override
  State<AndieAppbar> createState() => _AndieAppbarState();
}

class _AndieAppbarState extends State<AndieAppbar> {
  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(255, 205, 84, 1.0),
      title: Image.asset('assets/andie_logo.png',
        width: 180,
      ),
      elevation: 0.0,
      actions: <Widget>[
        Center(
          child: Container(
            margin: const EdgeInsets.only(right: 65),
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('My Jobs',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.only(right: 65),
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('Ratings',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.only(right: 65),
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: (){
                Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                    Animation secondaryAnimation)=>AndieProfile(),
                    transitionDuration: Duration(seconds: 0)),
                );
              },
              child: const Text('Profile',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.only(right: 65),
            child: ElevatedButton(
              child: Text('Log out'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ),
        )
      ],
    );
  }
}
*/
