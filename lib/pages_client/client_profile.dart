import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prjct_andie/pages/andie_profile_andie.dart';
import 'package:prjct_andie/services/auth.dart';
import 'client_category_v2.dart';
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
              width: 180,
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
                    Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation)=>ClientCategory(),
                    transitionDuration: const Duration(seconds: 0)),
                    );
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
                  ]),
                  Container(
                    padding:
                    const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                    child: Text(
                      myName,
                      style: GoogleFonts.robotoMono(
                        fontSize:96,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 10,bottom: 30),
                    child: Text(
                      'Contact Information',
                      style: GoogleFonts.roboto(
                          fontSize: 40,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    children: [
                      //--------- THIS IS FOR TEXT LABEL --------
                      Container(
                        margin: const EdgeInsets.only(right: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 0),
                              child:  Text('Phone Number:',
                                style: GoogleFonts.roboto(
                                    fontSize: 35,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 0),
                              child: Text('Gender:',
                                style: GoogleFonts.roboto(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(top: 5, bottom: 0),
                                child:   Text('Age:',
                                  style: GoogleFonts.roboto(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      letterSpacing: 2.0),
                                  textAlign: TextAlign.center,
                                )),
                            Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 0),
                              child: Text('Gmail:',
                                style: GoogleFonts.roboto(
                                    fontSize: 35,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 20),
                              child: Text('Facebook:',
                                style: GoogleFonts.roboto(
                                    fontSize: 35,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),

                      //----------- this is IS FOR DATA  --------
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 5,),
                            child:  Text(
                              '$myNumber',
                              style: GoogleFonts.roboto(
                                  fontSize: 35,
                                  color: Colors.black,
                                  /*fontWeight: FontWeight.bold,*/
                                  letterSpacing: 2.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5,),
                            child:  Text(
                              '$myGender',
                              style: GoogleFonts.roboto(
                                  fontSize: 35,
                                  color: Colors.black,
                                  /*fontWeight: FontWeight.bold,*/
                                  letterSpacing: 2.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(top: 5),
                              child:  Text(
                                '$myAge',
                                style: GoogleFonts.roboto(
                                    fontSize: 35,
                                    color: Colors.black,
                                    letterSpacing: 2.0),
                                textAlign: TextAlign.center,
                              )),
                          Container(
                            padding: const EdgeInsets.only(top: 5,),
                            child: Text(
                              '$myEmail',
                              style: GoogleFonts.roboto(
                                  fontSize: 35,
                                  color: Colors.black,
                                  letterSpacing: 2.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 20),
                            child: Text(
                              '$myFb',
                              style: GoogleFonts.roboto(
                                  fontSize: 35,
                                  color: Colors.black,
                                  letterSpacing: 2.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              await _auth.signOut();
                              html.window.location.reload();
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(40,50),
                              side: const BorderSide(
                                width: 1, color: Colors.black,
                              ),
                              primary: Color.fromRGBO(220, 57, 57, 1.0)
                            ),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child:  Text(
                                "LOG OUT",
                                style: GoogleFonts.roboto(
                                    fontSize:21,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 2.0),
                                textAlign: TextAlign.center,
                              ),
                            ))
                      ],
                    ),
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