import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';
import 'andie_my_job.dart';
import 'andie_profile_andie.dart';
import 'package:universal_html/html.dart' as html;

void main() {
  runApp( MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      home: const AndieRatings1()));
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class AndieRatings1 extends StatefulWidget {
  const AndieRatings1({Key? key}) : super(key: key);

  @override
  State<AndieRatings1> createState() => _AndieRatings1State();
}

class _AndieRatings1State extends State<AndieRatings1> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    var card = SizedBox(
      height: 170,
      width: 170,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: const Color.fromRGBO(255, 205, 84, 1.0),
          elevation: 9,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.fromLTRB(4.0, 3.0, 10.0, 2.0),
                child: const Text(
                  "Name: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5.0, 2.0, 10.0, 10.0),
                child: const Text(
                  "Date: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),Container(
                margin: const EdgeInsets.fromLTRB(5.0, 2.0, 10.0, 10.0),
                child: const Text(
                  "Comment:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                margin:EdgeInsets.only(left: 30),
                color: Colors.cyan,
                width: 130,
                height: 90,
              )
            ],
          ),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 205, 84, 1.0),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: AppBar(
            backgroundColor: const Color.fromRGBO(255, 205, 84, 1.0),
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
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: (){
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                          Animation secondaryAnimation)=>const AndieMyJobs(),
                          transitionDuration: const Duration(seconds: 0)),
                      );
                    },
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
                    onPressed: () {
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                          Animation secondaryAnimation)=>const AndieRatings1(),
                          transitionDuration: const Duration(seconds: 0)),
                      );
                    },
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
                          Animation secondaryAnimation)=>const AndieProfile(),
                          transitionDuration: const Duration(seconds: 0)),
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
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background1.png'),
                fit: BoxFit.cover,
              )),
          child: Row(
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                  margin: const EdgeInsets.all(30.0),
                  width: 1500,
                  height: 800,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.green,
                        child: const Expanded(
                          flex: 5,
                          child: Text(
                            'RATINGS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          width: 300,
                          height: 300,
                          color: Colors.red,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                  margin: const EdgeInsets.all(30.0),
                  width: 1500,
                  height: 800,
                  color: Colors.white,
                  child: GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    children: [
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
