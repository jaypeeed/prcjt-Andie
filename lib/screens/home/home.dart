import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prjct_andie/services/auth.dart';
import 'package:prjct_andie/services/database.dart';
import 'package:provider/provider.dart';
import 'package:prjct_andie/screens/home/profile_list.dart';

import '../../appbar/andie_appbar.dart';
import '../../pages/andie_my_job.dart';
import '../../pages/andie_profile_andie.dart';


class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService(uid: '').profile,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.orangeAccent[50],
        appBar: AppBar(
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
                    textStyle: const TextStyle(fontSize: 20),
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
                  },
                ),
              ),
            )
          ],
        ),
        body:Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background2.png'),
                fit: BoxFit.cover,
              )
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 250),
                child: Row(
                  children: const [
                    Expanded(
                      child: Center(
                        child: Text(
                          'HI ANDIE!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 100.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  children: const [
                    Expanded(
                      child: Center(
                        child: Text(
                          'What would you like to do today?',
                          style: TextStyle(
                            fontSize: 45.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const ProfileList(),
            ],
          ),
        ),





        //ProfileList(),
      ),
    );
  }
}
