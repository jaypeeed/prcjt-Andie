import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prjct_andie/services/auth.dart';
import 'client_my_andies.dart';
import 'package:universal_html/html.dart' as html;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
/*void main() {
  runApp(const MaterialApp(home: AndieProfile()));
}*/

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
String myEmail = '';
String myGender = '';
String myAge = '';
String myName = '';
String myFb = '';
String myNumber = '';

class ClientProfile extends StatefulWidget {


  @override
  State<ClientProfile> createState() => _ClientProfileState();
}

class _ClientProfileState extends State<ClientProfile> {
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
        myEmail = userData.data()!['email'];
        myGender = userData.data()!['gender'];
        myAge = userData.data()!['age'];
        myNumber = userData.data()!['contNumber'];
        myName = userData.data()!['name'];
        myFb = userData.data()!['fb'];

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
            title: Image.asset(
              'assets/andie_logo.png',
              height: 80,
              width: 110,
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 65),
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation)=>const ClientMyAndie(),
                        transitionDuration: const Duration(seconds: 0)),
                    );
                  },
                  child: const Text(
                    'My Andie',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 65),
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {

                  },
                  child: const Text(
                    'Category',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 65),
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation)=>ClientProfile(),
                        transitionDuration: const Duration(seconds: 0)),
                    );
                  },
                  child: const Text(
                    'Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 40,
            child: Container(
              padding: const EdgeInsets.only(top: 40,bottom: 40,right: 40),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 100,
                    child: Image.asset(
                      'assets/profile_sample.jpg',
                    ),
                  ),
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
                  Row(children: const [
                    /*
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
                            color: Color.fromRGBO(196, 196, 196, 1.0))),*/
                    /*Container(
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
                            color: Color.fromRGBO(196, 196, 196, 1.0))),*/
                    /*Container(
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
                            color: Color.fromRGBO(196, 196, 196, 1.0)))*/
                  ]),
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
                  const Text(
                    "hello ",
                    style: TextStyle(
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
                        padding: const EdgeInsets.only(top: 5, bottom: 0),
                        child:  const Text('Gender:',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5, bottom: 0,left: 103),
                        child:  Text(
                          myGender,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              /*fontWeight: FontWeight.bold,*/
                              letterSpacing: 2.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(top: 5, bottom: 0,left: 10),
                          child:  const Text('Age:',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                letterSpacing: 2.0),
                            textAlign: TextAlign.center,
                          )),
                      Container(
                          padding: const EdgeInsets.only(top: 5, bottom: 0,left: 120),

                          child:  Text(
                            myAge,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                letterSpacing: 2.0),
                            textAlign: TextAlign.center,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 5, bottom: 0),
                        child: const Text(
                          'Gmail: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5, bottom: 0,left: 108),
                        child: Text(
                          myEmail,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              letterSpacing: 2.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 5, bottom: 20),
                        child: const Text(
                          'Facebook: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5, bottom: 20,left: 68),
                        child: Text(
                          myFb,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              letterSpacing: 2.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            await _auth.signOut();
                            html.window.location.reload();
                          },
                          child: const Align(
                            alignment: Alignment.bottomRight,
                            child:  Text(
                              "LOG OUT",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 2.0),
                              textAlign: TextAlign.center,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}