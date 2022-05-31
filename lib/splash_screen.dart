import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:prjct_andie/pages/andie_profile_andie.dart';
import 'package:prjct_andie/Recycle%20Bin/andie_sign_up_page.dart';

import 'main.dart';

void main() {
  runApp(const MaterialApp(home: SplashScreen()));
}


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        backgroundColor: Color.fromRGBO(255, 205, 84, 1.0),
        splash: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(flex:1,child: Image.asset('assets/andie_logo.png',)),
            Expanded(flex:5,child: Image.asset('andie_splash_screen.gif',)),
          ],
        ),
        nextScreen:SignUp(),
      splashIconSize: 800,
     duration: 5000,
    );
  }
}
