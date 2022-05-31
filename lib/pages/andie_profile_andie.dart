import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';
import 'andie_my_job.dart';
import 'package:universal_html/html.dart' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'andie_ratings.dart';

/*
void main() {
  runApp(const MaterialApp(home: AndieProfile()));
}
*/

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
String myName = '';
String myExp = '';
String myEdu = '';
String myYears = '';
String myGender = '';
String myAge = '';
String myEmail = '';
String myFb = '';
String myNumber = '';

class AndieProfile extends StatefulWidget {
  const AndieProfile({Key? key}) : super(key: key);

  @override
  State<AndieProfile> createState() => _AndieProfileState();
}

class _AndieProfileState extends State<AndieProfile> {
  @override
  void initState() {
    super.initState();
    _getdata();
  }

  final AuthService _auth = AuthService();

  void _getdata() async {
    User? user = _firebaseAuth.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .snapshots()
        .listen((userData) {

      setState(() {

        myName = userData.data()!['name'];
        myExp = userData.data()!['experience'];
        myEdu = userData.data()!['school'];
        myYears = userData.data()!['yearsOfWork'];
        myGender = userData.data()!['gender'];
        myAge = userData.data()!['age'];
        myEmail = userData.data()!['email'];
        myFb = userData.data()!['facebook'];
        myNumber = userData.data()!['contactNumber'];

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Center(
              child: Container(
                margin: const EdgeInsets.only(right: 65),
                child: ElevatedButton(
                  child: const Text('Log out'),
                  onPressed: () async {
                    await _auth.signOut();
                    html.window.location.reload();
                  },
                ),
              ),
            )
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 40,
            child: Container(
              padding: const EdgeInsets.all(40),
              //color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 80,
                    child: Image.asset(
                      'assets/profile_sample.jpg',
                    ),
                  ),
                  Expanded(
                      flex: 20,
                      child: Container(
                          padding: const EdgeInsets.only(top: 40),
                          child: const Text(
                            'Set Rating SOON',
                            style: TextStyle(fontSize: 40),
                          ))),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 60,
            child: Container(
              //color: Colors.green,
              padding: const EdgeInsets.only(right: 40, bottom: 40, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: Container (
                      margin: const EdgeInsets.only(top: 5),
                      //   color: Colors.blue,
                      width: 1200,
                      height: 40,
                      child: GridView(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 10,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 3,
                        ),
                        children: const [

                        ]
                      ),

                    ),
                  ),
                  /*Row(children: [
                    Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: const Text(
                          'Builder',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(top: 8),
                        height: 40.0,
                        width: 140.0,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.0)),
                            color: Color.fromRGBO(196, 196, 196, 1.0))),
                    Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: const Text(
                          'Plumber',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(top: 8),
                        height: 40.0,
                        width: 140.0,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.0)),
                            color: Color.fromRGBO(196, 196, 196, 1.0))),
                    Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: const Text(
                          'Painter',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(top: 8),
                        height: 40.0,
                        width: 140.0,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.0)),
                            color: Color.fromRGBO(196, 196, 196, 1.0)))
                  ]),*/
                  Container(
                    padding:
                        const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                    child: Text(
                      myName,
                      style: const TextStyle(
                          fontSize: 80,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                   Text(
                    ' $myExp. $myEdu. $myYears',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                   Container(
                     padding: const EdgeInsets.only(top: 10,bottom: 10),
                     child: const Text(
                      'Contact Information',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2.0),
                      textAlign: TextAlign.center,
                  ),
                   ),

                  Row(
                    children: [
                      //--------- this for TEXT LABEL-----------
                      Container(
                        margin: const EdgeInsets.only(right: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 0),
                              child: const Text(
                                'Phone Number:',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 0),
                              child: const Text(
                                'Gmail:',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 20),
                              child: const Text(
                                'Facebook:',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //--------- this for TEXT DATA-----------
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 0),
                            child: Text(
                              '$myNumber',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  //fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 0),
                            child: Text(
                              '$myEmail',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  //fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 20),
                            child: Text(
                              '$myFb',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  //fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


