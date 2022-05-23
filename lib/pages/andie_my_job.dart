import 'dart:html';

import 'package:flutter/material.dart';
import '../services/auth.dart';
import 'andie_profile_andie.dart';

/*void main() {
  runApp(const MaterialApp(home: AndieMyJobs()));
}*/

class AndieMyJobs extends StatefulWidget {
  const AndieMyJobs({Key? key}) : super(key: key);

  @override
  State<AndieMyJobs> createState() => _AndieMyJobsState();
}

class _AndieMyJobsState extends State<AndieMyJobs> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*      drawer: const NavigationDrawerWidget(),*/
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
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background1.png'),
              fit: BoxFit.cover,
            )),
        child: Row(
          children: [
            // Left Side !!!!!!!!!!!!!!!!!!!!!!
            Expanded(
              flex: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(20)),
                    border: Border.all(
                      color: Colors.black,
                    )),
                margin: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                          margin: const EdgeInsets.only(left: 30, top: 30),
                          child: const Text(
                            'Client List',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),

                    // CONTAINER FOR LIST VIEW!!!!!!!!!!!!!
                    Expanded(
                      flex: 10,
                      child: Container(
                        margin: const EdgeInsets.only(
                            bottom: 30, left: 30, right: 30),
                        decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(0)),
                            border: Border.all(
                              color: Colors.black,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Right Side !!!!!!!!!!!!!!!!!!!!


            Expanded(
              flex: 10,
              child: Container(
                padding: const EdgeInsets.all(40),
                color: Colors.white,
                margin: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex:110,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text(
                          'Job Description',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex:50,
                      child: Container(

                        margin: const EdgeInsets.fromLTRB(10,0, 10,0),
                        child: const Text('Client Note',
                            style: TextStyle(
                                fontSize: 17.5, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Expanded(
                      flex: 100,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 10, 10),
                        color: Colors.redAccent,
                        child: const SizedBox(
                          width: 600,
                          height: 50,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 50,
                      child: Container(
                        /*color: Colors.yellowAccent,*/
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Row(

                          children: [
                            Expanded(
                              flex:90,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: const Text('Date To Start:',
                                    style: TextStyle(
                                        fontSize: 17.5, fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Expanded(
                              flex: 215,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 5, 195, 10),
                                color: Colors.redAccent,
                                child: const SizedBox(
                                  width: 150,
                                  height: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 30,
                      child: Container(
                        /* color: Colors.redAccent,*/
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: const Text('Client Contact Information',
                            style: TextStyle(
                                fontSize: 17.5, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Expanded(
                      flex: 50,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        child: Row(
                          children: [
                            const Text('Contact Number:'),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              color: Colors.redAccent,
                              child: const SizedBox(
                                width: 150,
                                height: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 50,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        child: Row(
                          children: [
                            const Text(' Messenger:'),
                            Container(
                              margin: const EdgeInsets.only(left: 48),
                              color: Colors.redAccent,
                              child: const SizedBox(
                                width: 150,
                                height: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 100,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(20, 20, 10, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            Expanded(
                              flex: 100,
                              child: Container(
                                margin: const EdgeInsets.only(left: 10, right: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color.fromRGBO(111, 215, 85, 1.0),
                                  ),
                                  onPressed: (){},
                                  child: const Text('Accept'),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 100,
                              child: Container(
                                margin: const EdgeInsets.only(left: 10, right: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color.fromRGBO(220, 57, 57, 1.0),
                                  ),
                                  onPressed: (){},
                                  child: const Text('Decline'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
