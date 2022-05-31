import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';
import 'andie_my_job.dart';
import 'package:universal_html/html.dart' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*
void main() {
  runApp(const MaterialApp(home: AndieProfile()));
}
*/

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
List<dynamic> skillsList=[];

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
    getSkillsList();

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
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation)=>AndieMyJobs(),
                        transitionDuration: Duration(seconds: 0)),
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
              color: Colors.white,
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
              color: Colors.white,
              padding: const EdgeInsets.only(right: 40, bottom: 40, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child:  Text(
                        skillsList.toString(),
                        style: const TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2.0),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    /////////////////////////////sdfgds//////////////////////////////////

                  ]),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                    child: Text(
                      '$myName',
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
                      Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 0),
                              child: Text(
                                'Phone Number: $myNumber',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 0),
                              child: Text(
                                'Gmail: $myEmail',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 20),
                              child: Text(
                                'Facebook: $myFb',
                                style: const TextStyle(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 0),
                              child: const Text(
                                //number
                                '',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    letterSpacing: 2.0),
                                textAlign: TextAlign.center,
                              )),
                          Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 0),
                            child: const Text(
                              //email
                              '',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  letterSpacing: 2.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 20),
                            child: const Text(
                              //name
                              '',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
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
  void getSkillsList() async{
    User? user = _firebaseAuth.currentUser;
    FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) {
      skillsList = value.data()!["skills"];
      print(skillsList);

      final bool skillsList1 = skillsList.every((skillsList) => true);

      print(skillsList1);

      skillsList.forEach(print);

      final str = skillsList.join(' ');

      print(str);

    });

    final value = await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get();


    skillsList = value.data()!["skills"];
  }



}


