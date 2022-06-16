import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

String clientUID2 ='';
String nameClient = '';
String ratingsClient = '';
String ageClient = '';
String genderClient = '';
String contClient = '';
String emailClient = '';
String facebookClient =  '';

String testAndie = '';
String nameAndie = '';
String skillsAndie = '';
String ageAndie = '';
String genderAndie = '';
String expAndie = '';
String schoolAndie = '';
String yowAndie = '';
String contAndie = '';
String emailAndie = '';
String facebookAndie = '';

String age = '';
String gender = '';
String cont = '';
String email = '';
String facebook =  '';

String clientNote='';

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

  bool isVisiblePending = true;
  bool isVisibleAccepted = false;
  bool isVisibleHistory = false;
  bool isVisibleButtons = false;
  bool isVisibleDoneButton = false;
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
                  padding: EdgeInsets.only(left: 30),
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
                            margin: const EdgeInsets.only(top: 30),
                            child: const Text(
                              'Client List',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      Expanded(
                        flex:2,
                        child: Row(
                          children: [
                            Expanded(
                              flex:2,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                  const Color.fromRGBO(255, 205, 84, 1.0),
                                ),
                                child: const Text('Pending'),
                                onPressed: () async {
                                  setState(() {
                                    isVisiblePending =true;
                                    isVisibleAccepted =false;
                                    isVisibleHistory =false;
                                    isVisibleButtons = false;
                                    isVisibleDoneButton = false;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              flex:1,
                              child: SizedBox(width: 1,),
                            ),
                            Expanded(
                              flex:2,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                  const Color.fromRGBO(111, 215, 85, 1.0),
                                ),
                                child: const Text('Accepted'),
                                onPressed: () async {
                                  setState(() {
                                    isVisibleAccepted =true;
                                    isVisiblePending =false;
                                    isVisibleHistory =false;
                                    isVisibleButtons = false;
                                    isVisibleDoneButton = false;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              flex:1,
                              child: SizedBox(width: 1,),
                            ),
                            Expanded(
                              flex:2,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color.fromRGBO(220, 57, 57, 1.0),
                                ),
                                child: const Text('History'),
                                onPressed: () async {
                                  setState(() {
                                    isVisibleHistory =true;
                                    isVisiblePending =false;
                                    isVisibleAccepted =false;
                                    isVisibleButtons = false;
                                    isVisibleDoneButton = false;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              flex:5,
                              child: SizedBox(width: 10,),
                            ),
                          ],
                        ),
                      ),
                      // CONTAINER FOR LIST VIEW!!!!!!!!!!!!!
                      Expanded(
                        flex: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Visibility(
                              visible: isVisiblePending,
                              child: Container(
                                width: 700,
                                height: 415,
                                margin: const EdgeInsets.only(
                                    bottom: 30, right: 30),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 205, 84, 1.0),
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
                                          clientNote = ((doc.data() as Map<String, dynamic>)['clientNote']);
                                          return Card(
                                            child: ListTile(
                                                onTap: () async {
                                                  isVisibleButtons = true;

                                                  final QuerySnapshot snap = await FirebaseFirestore.instance.collection('pendingClient').where('clientNote', isEqualTo: clientNote).get();
                                                  setState(() {
                                                    name = (doc.data() as Map<String, dynamic>)['clientName'];
                                                    clientNote2 = ((doc.data() as Map<String, dynamic>)['clientNote']);
                                                    startDate = (doc.data() as Map<String, dynamic>)['startDate'];
                                                    clientCont = (doc.data() as Map<String, dynamic>)['clientCont'];
                                                    fb = (doc.data() as Map<String, dynamic>)['clientFacebook'];
                                                    clientUID = (doc.data() as Map<String, dynamic>)['clientUID'];
                                                    docUID = snap.docs[0]['docUID'];
                                                  });
                                                  print(clientNote2);
                                                  print(clientUID);
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
                            ),
                            Visibility(
                              visible: isVisibleAccepted,
                              child: Container(
                                width: 700,
                                height: 415,
                                margin: const EdgeInsets.only(
                                    bottom: 30,right: 30),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(111, 215, 85, 1.0),
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(0)),
                                    border: Border.all(
                                      color: Colors.black,
                                    )),

                                child: StreamBuilder<QuerySnapshot>(
                                  stream: db.collection('finalClient')
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
                                          clientNote = ((doc.data() as Map<String, dynamic>)['clientNote']);
                                          return Card(
                                            child: ListTile(
                                                onTap: () async {

                                                  isVisibleDoneButton = true;
                                                  final QuerySnapshot snap = await FirebaseFirestore.instance.collection('finalClient').where('clientNote', isEqualTo: clientNote).get();
                                                  setState(() {
                                                    name = (doc.data() as Map<String, dynamic>)['clientName'];
                                                    clientNote2 = ((doc.data() as Map<String, dynamic>)['clientNote']);
                                                    startDate = (doc.data() as Map<String, dynamic>)['startDate'];
                                                    clientCont = (doc.data() as Map<String, dynamic>)['clientCont'];
                                                    fb = (doc.data() as Map<String, dynamic>)['clientFacebook'];
                                                    clientUID = (doc.data() as Map<String, dynamic>)['clientUID'];
                                                    docUID = snap.docs[0]['docUID'];
                                                  });
                                                },

                                                leading: Text((doc.data() as Map<String, dynamic>)['clientName']),
                                                title: Text((doc.data() as Map<String, dynamic>)['clientNote'] ),
                                                subtitle: Text(t.toDate().toString() )
                                            ),
                                          );
                                        }).toList(),


                                      );
                                    }
                                  },
                                ),

                              ),
                            ),
                            Visibility(
                              visible: isVisibleHistory,
                              child: Container(
                                width: 700,
                                height: 415,
                                margin: const EdgeInsets.only(
                                    bottom: 30, right: 30),
                                decoration: BoxDecoration(
                                    color:  Color.fromRGBO(220, 57, 57, 1.0),
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(0)),
                                    border: Border.all(
                                      color: Colors.black,
                                    )),

                                child: StreamBuilder<QuerySnapshot>(
                                  stream: db.collection('historyClient')
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
                                          Timestamp t = (doc.data() as Map<String, dynamic>)['dateFinished'];
                                          var clientNote = ((doc.data() as Map<String, dynamic>)['clientNote']);

                                          return Card(
                                            child: ListTile(
                                                onTap: () async {

                                                  final QuerySnapshot snap = await FirebaseFirestore.instance.collection('historyClient').where('clientNote', isEqualTo: clientNote).get();
                                                  setState(() {
                                                    name = snap.docs[0]['clientName'];
                                                    clientNote2 = snap.docs[0]['clientNote'];
                                                    startDate = snap.docs[0]['startDate'];
                                                    clientCont = snap.docs[0]['clientCont'];
                                                    fb = snap.docs[0]['clientFacebook'];
                                                    clientUID = snap.docs[0]['clientUID'];
                                                    docUID = snap.docs[0]['docUID'];
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
                            ),
                          ],
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
                          child:  Text(name,
                              style: TextStyle(
                                  fontSize: 17.5, fontWeight: FontWeight.bold)),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Visibility(
                                visible: isVisibleDoneButton,
                                child: Container(
                                  margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                      const Color.fromRGBO(111, 215, 85, 1.0),
                                    ),
                                    onPressed: () {
                                      showDialog(context: context, builder: (context){
                                        return AlertDialog(
                                            title: Text("Warning!"),
                                            content: Text("Are you sure You are done with the Job?"),
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () async{

                                                  final QuerySnapshot client =
                                                  await FirebaseFirestore.instance
                                                      .collection('users')
                                                      .where('uid',
                                                      isEqualTo: clientUID)
                                                      .get();
                                                  setState(() {
                                                    clientUID2 = client.docs[0]['uid'];
                                                    nameClient = client.docs[0]['name'];
                                                    ageClient = client.docs[0]['age'];
                                                    genderClient = client.docs[0]['gender'];
                                                    contClient = client.docs[0]['contNumber'];
                                                    emailClient = client.docs[0]['email'];
                                                    facebookClient =  client.docs[0]['fb'];
                                                  });

                                                  FirebaseFirestore.instance
                                                      .collection("historyClient")
                                                      .doc()
                                                      .set({
                                                    "clientUID": clientUID,
                                                    "andieUID": FirebaseAuth.instance.currentUser?.uid,
                                                    "clientName": nameClient,
                                                    "clientAge": ageClient,
                                                    "clientGender": genderClient,
                                                    "clientCont": contClient,
                                                    "clientEmail": emailClient,
                                                    "clientFacebook": facebookClient,
                                                    "clientNote": clientNote2,
                                                    "dateFinished": DateTime.now(),
                                                    'startDate': startDate,
                                                    'docUID': docUID,
                                                    'status': 'history',
                                                  });

                                                  final QuerySnapshot snap2 = await FirebaseFirestore.instance.collection('finalClient').where('clientNote', isEqualTo: clientNote2).where('clientUID', isEqualTo: clientUID).get();
                                                  setState(() {
                                                    snap2.docs[0].reference.delete();
                                                  });

                                                  name='';
                                                  clientNote2 ='';
                                                  startDate = '';
                                                  clientCont = '';
                                                  fb = '';

                                                  Navigator.pop(context, false);
                                                  },
                                                child: Text('Yes'),
                                                style: ElevatedButton.styleFrom(
                                                  primary: const Color.fromRGBO(111, 215, 85, 1.0),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () => Navigator.pop(context, false),
                                                child: Text('No'),
                                                style: ElevatedButton.styleFrom(
                                                  primary: const Color.fromRGBO(220, 57, 57, 1.0),
                                                ),
                                              ),
                                            ]
                                        );
                                      });

                                    },
                                    child: const Text('DONE'),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: isVisibleButtons,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  child: ElevatedButton(
                                    child: const Text('Accept'),
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color.fromRGBO(111, 215, 85, 1.0),
                                    ),
                                    onPressed: (){
                                      print(clientNote);
                                      print(clientUID2);
                                      isVisibleButtons = false;
                                      showDialog(context: context, builder: (context){
                                        return AlertDialog(
                                          title: Text("Hi Andie!"),
                                          content: Text("You are About to Accept the Job. Are you sure you want to Accept the Job?"),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () async {

                                                final QuerySnapshot client =
                                                await FirebaseFirestore.instance
                                                    .collection('users')
                                                    .where('uid',
                                                    isEqualTo: clientUID)
                                                    .get();
                                                setState(() {
                                                  clientUID2 = client.docs[0]['uid'];
                                                  nameClient = client.docs[0]['name'];
                                                  ageClient = client.docs[0]['age'];
                                                  genderClient = client.docs[0]['gender'];
                                                  contClient = client.docs[0]['contNumber'];
                                                  emailClient = client.docs[0]['email'];
                                                  facebookClient =  client.docs[0]['fb'];
                                                });

                                                FirebaseFirestore.instance
                                                    .collection("finalClient")
                                                    .doc()
                                                    .set({
                                                  "clientUID": clientUID2,
                                                  "andieUID": FirebaseAuth.instance.currentUser?.uid,
                                                  "clientName": nameClient,
                                                  "clientAge": ageClient,
                                                  "clientGender": genderClient,
                                                  "clientCont": contClient,
                                                  "clientEmail": emailClient,
                                                  "clientFacebook": facebookClient,
                                                  "clientNote": clientNote2,
                                                  "dateTime": DateTime.now(),
                                                  'startDate': startDate,
                                                  'docUID': docUID,
                                                  'status': 'accepted',
                                                });

                                                final QuerySnapshot andie =
                                                await FirebaseFirestore.instance
                                                    .collection('users')
                                                    .where('uid',
                                                    isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                                                    .get();
                                                setState(() {
                                                  testAndie = andie.docs[0]['uid'];
                                                  nameAndie = andie.docs[0]['name'];
                                                  skillsAndie = andie.docs[0]['skills'].toString();
                                                  ageAndie = andie.docs[0]['age'];
                                                  genderAndie = andie.docs[0]['gender'];
                                                  expAndie = andie.docs[0]['experience'];
                                                  schoolAndie = andie.docs[0]['school'];
                                                  yowAndie =andie.docs[0]['yearsOfWork'];
                                                  contAndie = andie.docs[0]['contactNumber'];
                                                  emailAndie = andie.docs[0]['email'];
                                                  ratings = andie.docs[0]['totalRate'].toString();
                                                  facebookAndie = andie.docs[0]['facebook'];
                                                });

                                                FirebaseFirestore.instance
                                                    .collection("finalAndie")
                                                    .doc()
                                                    .set({
                                                  "clientUID": clientUID,
                                                  "andieUID":  FirebaseAuth.instance.currentUser?.uid,
                                                  "andieName": nameAndie,
                                                  "andieSkills": skillsAndie,
                                                  "andieAge": ageAndie,
                                                  "andieGender": genderAndie,
                                                  "andieExp": expAndie,
                                                  "andieSchool": schoolAndie,
                                                  "andieYow": yowAndie,
                                                  "andieCont": contAndie,
                                                  "andieEmail": emailAndie,
                                                  "andieFacebook": facebookAndie,
                                                  "andieTotalRate": ratings,
                                                  "clientNote": clientNote2,
                                                  "dateTime": DateTime.now(),
                                                  'startDate': startDate,
                                                  'clientCont': clientCont,
                                                  'docUID': docUID,
                                                  'status': 'accepted',
                                                });
                                                final QuerySnapshot snap2 = await FirebaseFirestore.instance.collection('pendingClient').where('clientNote', isEqualTo: clientNote2).where('clientUID', isEqualTo: clientUID).get();
                                                setState(() {
                                                  snap2.docs[0].reference.delete();
                                                });
                                                final QuerySnapshot snap3 = await FirebaseFirestore.instance.collection('pendingAndie').where('clientNote', isEqualTo: clientNote2).where('clientUID', isEqualTo: clientUID).get();
                                                setState(() {
                                                  snap3.docs[0].reference.delete();
                                                });
                                                Navigator.pop(context, false);

                                                name='';
                                                clientNote2 ='';
                                                startDate = '';
                                                clientCont = '';
                                                fb = '';
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
                              Visibility(
                                visible: isVisibleButtons,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color.fromRGBO(220, 57, 57, 1.0),
                                    ),
                                    onPressed: (){
                                      isVisibleButtons = false;
                                      showDialog(context: context, builder: (context){
                                        return AlertDialog(
                                          title: Text("Hi Andie!"),
                                          content: Text("You are About to Decline the Job. Are you sure you want to Decline the Job?"),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () async {

                                                final QuerySnapshot snap2 = await FirebaseFirestore.instance.collection('pendingClient').where('clientNote', isEqualTo: clientNote2).where('clientUID', isEqualTo: clientUID).get();
                                                setState(() {
                                                  snap2.docs[0].reference.delete();
                                                });
                                                name='';
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
