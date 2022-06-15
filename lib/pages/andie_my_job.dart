import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth.dart';
import 'andie_profile_andie.dart';
import 'andie_ratings.dart';
import 'package:universal_html/html.dart' as html;

/*void main() {
  runApp(const MaterialApp(home: AndieMyJobs()));
}*/

final db = FirebaseFirestore.instance;
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
var tmpArray = ['ELECTRICIAN', 'HOUSE KEEPER'];
String andieName = '';

String name = '';
String clientNote2 ='';
String startDate = '';
String clientCont = '';
String fb = '';
String ratings = '';
String clientUID ='';
String docUID ='';

double rateCount =  0.0;
double ratings2 =  0.0;
double rateCounter = 1.0;

class AndieMyJobs extends StatefulWidget {
  const AndieMyJobs({Key? key}) : super(key: key);

  @override
  State<AndieMyJobs> createState() => _AndieMyJobsState();
}

class _AndieMyJobsState extends State<AndieMyJobs> {
  final AuthService _auth = AuthService();

  String counter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*      drawer: const NavigationDrawerWidget(),*/
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

                        child: StreamBuilder<QuerySnapshot>(
                          stream: db.collection('pendingClient')
                              .where('andieUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              Text ('HELLO');
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              snapshot.data!.docs.forEach(
                                    (element) {
                                  element.id;
                                  print(element.id);
                                },
                              );
                              print(snapshot.data!.docs.length.toString());
                              counter = snapshot.data!.docs.length.toString();

                              return ListView (

                                children: snapshot.data!.docs.map((doc) {
                                  Timestamp t = (doc.data() as Map<String, dynamic>)['dateTime'];
                                  var clientNote = ((doc.data() as Map<String, dynamic>)['clientNote']);

                                  return Card(
                                    child: ListTile(
                                        onTap: () async {

                                          final QuerySnapshot snap = await FirebaseFirestore.instance.collection('pendingClient').where('clientNote', isEqualTo: clientNote).get();
                                          setState(() {
                                            name = (doc.data() as Map<String, dynamic>)['clientName'];
                                            clientNote2 = ((doc.data() as Map<String, dynamic>)['clientNote']);
                                            startDate = (doc.data() as Map<String, dynamic>)['startDate'];
                                            clientCont = (doc.data() as Map<String, dynamic>)['clientCont'];
                                            fb = (doc.data() as Map<String, dynamic>)['clientFacebook'];
                                            clientUID = (doc.data() as Map<String, dynamic>)['clientUID'];
                                            docUID = (doc.data() as Map<String, dynamic>)['docUID'];
                                          });
                                        },

                                        leading: Text((doc.data() as Map<String, dynamic>)['clientName']),
                                        title: Text((doc.data() as Map<String, dynamic>)['clientNote'] ),
                                        subtitle: Text((doc.data() as Map<String, dynamic>)['startDate'] )
                                    ),
                                  );
                                }).toList(),


                              );
                            }
                          },
                        ),

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
                          width: 600,
                          height: 50,
                        child: Text(clientNote2),

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
                                child: Text(startDate),
                                  width: 150,
                                  height: 25,

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
                              child: Text(clientCont),
                                width: 150,
                                height: 25,

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
                              child: Text(fb),
                                width: 250,
                                height: 25,

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
                                  child: const Text('Accept'),
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color.fromRGBO(111, 215, 85, 1.0),
                                  ),
                                  onPressed: (){
                                    showDialog(context: context, builder: (context){
                                      return AlertDialog(
                                        title: Text("Hi Andie!"),
                                        content: Text("You are About to Accept the Job. Are you sure you want to Accept the Job?"),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: (){




                                            },
                                            child: Text('Yes I Accept'),
                                            style: ElevatedButton.styleFrom(
                                              primary: const Color.fromRGBO(111, 215, 85, 1.0),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () => Navigator.pop(context, false),
                                            child: Text('Cancel'),
                                            style: ElevatedButton.styleFrom(
                                              primary: const Color.fromRGBO(220, 57, 57, 1.0),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                                  },
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
                                  onPressed: (){
                                    showDialog(context: context, builder: (context){
                                      return AlertDialog(
                                        title: Text("Hi Andie!"),
                                        content: Text("You are About to Decline the Job. Are you sure you want to Decline the Job?"),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () async {

                                              final QuerySnapshot snap2 = await FirebaseFirestore.instance.collection('pendingClient').where('docUID', isEqualTo: docUID).get();
                                              setState(() {
                                                snap2.docs[0].reference.delete();
                                              });
                                              
                                              clientNote2 ='';
                                              startDate = '';
                                              clientCont = '';
                                              fb = '';

                                              Navigator.pop(context, false);
                                            },
                                            child: Text('Yes, Decline'),
                                            style: ElevatedButton.styleFrom(
                                              primary: const Color.fromRGBO(111, 215, 85, 1.0),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () => Navigator.pop(context, false),
                                            child: Text('Cancel'),
                                            style: ElevatedButton.styleFrom(
                                              primary: const Color.fromRGBO(220, 57, 57, 1.0),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                                  },
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
