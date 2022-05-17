import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';
import 'andie_my_job.dart';

/*
void main() {
  runApp(const MaterialApp(home: AndieProfile()));
}
*/

class AndieProfile extends StatefulWidget {
  const AndieProfile({Key? key}) : super(key: key);

  @override
  State<AndieProfile> createState() => _AndieProfileState();
}

class _AndieProfileState extends State<AndieProfile> {
  final AuthService _auth = AuthService();
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
                    textStyle: const TextStyle(fontSize: 20),
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
                  ]),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                    child: const Text(
                      'Handy Many',
                      style: TextStyle(
                          fontSize: 80,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Text(
                    'I  have three years of experience in being a\n plumber. Finished a technical course in TESDA\n and that’s basically it.',
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
                        margin: EdgeInsets.only(right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 0),
                              child: const Text(
                                'Phone Number: ',
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
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 0),
                              child: const Text(
                                '0987654321',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    letterSpacing: 2.0),
                                textAlign: TextAlign.center,
                              )),
                          Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 0),
                            child: const Text(
                              'handymany@gmail.com',
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
                              'Handy Many',
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
}


