import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../services/auth.dart';
import 'client_category_v2.dart';
import 'client_profile.dart';

final db = FirebaseFirestore.instance;
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
var tmpArray = ['ELECTRICIAN', 'HOUSE KEEPER'];
String andieName = '';

String name = '';
String clientNote2 ='';
String startDate = '';
String andieCont = '';
String fb = '';
String ratings = '';
String andieUID ='';
String docUID ='';


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


double rateCount =  0.0;
double ratings2 =  0.0;
double rateCounter = 1.0;
String skills = '';


void main() => runApp(const MaterialApp(home: ClientMyAndie()));

class ClientMyAndie extends StatefulWidget {
  const ClientMyAndie({Key? key}) : super(key: key);

  @override
  State<ClientMyAndie> createState() => _ClientMyAndieState();
}

class _ClientMyAndieState extends State<ClientMyAndie> {

  @override
  void initState() {
    super.initState();
    _getdata();
  }

  var tmpArray2 = [''];
  String counter = '';
  String myEmail = '';
  String myGender = '';
  String myAge = '';
  String myName = '';
  String myFb = '';
  String myNumber = '';
  String note = '';

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

  Future<List<DocumentSnapshot>> getData() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore
        .collection("users")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get();
    return qn.docs;
  }

  bool isVisiblePending = true;
  bool isVisibleAccepted = false;
  bool isVisibleHistory = false;
  bool isVisibleButtons = false;
  bool isVisibleDelButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*      drawer: const NavigationDrawerWidget(),*/
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
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (BuildContext context,
                                  Animation animation,
                                  Animation secondaryAnimation) =>
                              const ClientMyAndie(),
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
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (BuildContext context,
                                  Animation animation,
                                  Animation secondaryAnimation) =>
                              ClientCategory(),
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
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (BuildContext context,
                                  Animation animation,
                                  Animation secondaryAnimation) =>
                              ClientProfile(),
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
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/background1.png'),
          fit: BoxFit.cover,
        )),
        child: Row(
          children: [
            // ------------------ Left Side ----------------
            Expanded(
              flex: 10,
              child: Container(
                padding: EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                            'My Andies',
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
                                  isVisibleDelButton = false;
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
                                  isVisibleDelButton = false;
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
                                  isVisibleDelButton = false;

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
                      flex: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Visibility (
                            visible: isVisiblePending,
                            child: Container(
                              width: 700,
                              height: 460,
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
                                stream: db
                                    .collection('pendingAndie')
                                    .where('clientUID',
                                        isEqualTo:
                                            FirebaseAuth.instance.currentUser?.uid)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    Text('HELLO');
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
                                    return Container(
                                      child: ListView(
                                        children: snapshot.data!.docs.map((doc) {
                                          Timestamp t = (doc.data()
                                              as Map<String, dynamic>)['dateTime'];
                                          var clientNote = ((doc.data()
                                              as Map<String, dynamic>)['clientNote']);

                                          return Card(
                                            child: ListTile(
                                                onTap: () async {
                                                  isVisibleDelButton = true;
                                                  final QuerySnapshot snap =
                                                      await FirebaseFirestore.instance
                                                          .collection('pendingAndie')
                                                          .where('clientNote',
                                                              isEqualTo: clientNote)
                                                          .get();
                                                  setState(() {
                                                    name = snap.docs[0]['andieName'];
                                                    clientNote2 = ((doc.data() as Map<
                                                        String,
                                                        dynamic>)['clientNote']);
                                                    startDate = (doc.data() as Map<
                                                        String, dynamic>)['startDate'];
                                                    andieCont = (doc.data() as Map<
                                                        String, dynamic>)['andieCont'];
                                                    fb = (doc.data() as Map<String,
                                                        dynamic>)['andieFacebook'];
                                                    ratings = (doc.data() as Map<String,
                                                            dynamic>)['andieTotalRate']
                                                        .toString();
                                                    andieUID = (doc.data() as Map<
                                                        String, dynamic>)['andieUID'];
                                                  });
                                                  final QuerySnapshot snap2 =
                                                      await FirebaseFirestore.instance
                                                          .collection('users')
                                                          .where('uid',
                                                              isEqualTo: andieUID)
                                                          .get();
                                                  setState(() {
                                                    rateCount =
                                                        snap2.docs[0]['rateCount'];
                                                    ratings2 = snap2.docs[0]['ratings'];
                                                    skills = snap2.docs[0]['skills'].toString();
                                                  });
                                                  print(ratings);
                                                  if(ratings=='null'){
                                                    ratings = 'No ratings';
                                                    print(ratings);
                                                  };
                                                },
                                                leading: Text((doc.data() as Map<String,
                                                    dynamic>)['andieName']),
                                                title: Text((doc.data() as Map<String,
                                                    dynamic>)['clientNote']),
                                                subtitle: Text(t.toDate().toString())),
                                          );
                                        }).toList(),
                                      ),
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
                              height: 460,
                              margin: const EdgeInsets.only(
                                  bottom: 30, right: 30),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(111, 215, 85, 1.0),
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(0)),
                                  border: Border.all(
                                    color: Colors.black,
                                  )),

                              child: StreamBuilder<QuerySnapshot>(
                                stream: db
                                    .collection('finalAndie')
                                    .where('clientUID',
                                    isEqualTo:
                                    FirebaseAuth.instance.currentUser?.uid)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    Text('HELLO');
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
                                    return ListView(
                                      children: snapshot.data!.docs.map((doc) {
                                        Timestamp t = (doc.data()
                                        as Map<String, dynamic>)['dateTime'];
                                        var clientNote = ((doc.data()
                                        as Map<String, dynamic>)['clientNote']);

                                        return Card(
                                          child: ListTile(
                                              onTap: () async {
                                                isVisibleButtons = true;
                                                final QuerySnapshot snap =
                                                await FirebaseFirestore.instance
                                                    .collection('finalAndie')
                                                    .where('clientNote',
                                                    isEqualTo: clientNote)
                                                    .get();
                                                setState(() {
                                                  name = (doc.data() as Map<String, dynamic>)['andieName'];
                                                  clientNote2 = ((doc.data() as Map<String, dynamic>)['clientNote']);
                                                  startDate = (doc.data() as Map<String, dynamic>)['startDate'];
                                                  andieCont = (doc.data() as Map<String, dynamic>)['andieCont'];
                                                  fb = (doc.data() as Map<String, dynamic>)['andieFacebook'];
                                                  ratings = (doc.data() as Map<String, dynamic>)['andieTotalRate'].toString();
                                                  andieUID = (doc.data() as Map<String, dynamic>)['andieUID'];
                                                  docUID =  (doc.data() as Map<String, dynamic>)['docUID'];
                                                });
                                                final QuerySnapshot snap2 =
                                                await FirebaseFirestore.instance
                                                    .collection('users')
                                                    .where('uid',
                                                    isEqualTo: andieUID)
                                                    .get();
                                                setState(() {
                                                  rateCount = snap2.docs[0]['rateCount'];
                                                  ratings = snap2.docs[0]['totalRate'].toString();
                                                  ratings2 = snap2.docs[0]['ratings'];
                                                  skills = snap2.docs[0]['skills'].toString();
                                                });
                                                if(ratings=='null'){
                                                  ratings = 'No ratings';
                                                  print(ratings);
                                                };
                                              },
                                              leading: Text((doc.data() as Map<String, dynamic>)['andieName']),
                                              title: Text((doc.data() as Map<String, dynamic>)['clientNote']),
                                              subtitle: Text((doc.data() as Map<String, dynamic>)['startDate']),
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
                              height: 460,
                              margin: const EdgeInsets.only(
                                  bottom: 30, right: 30),
                              decoration: BoxDecoration(
                                  color:  Color.fromRGBO(220, 57, 57, 1.0),
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(0)),
                                  border: Border.all(
                                    color: Colors.black,
                                  )),
                              /*child: FutureBuilder(
                                    future: getData(),
                                    builder: (_,
                                        AsyncSnapshot<List<DocumentSnapshot>>
                                            snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.builder(
                                            itemCount: snapshot.data!.length,
                                            itemBuilder: (context, index) {
                                              return Card(
                                                child: ListTile(
                                                  title: Text(snapshot.data![index]
                                                      .get('pendingAndie')[index]
                                                      .toString()),
                                                  onTap: () async {
                                                    FirebaseFirestore.instance
                                                        .collection('users')
                                                        .where("uid",
                                                            isEqualTo: FirebaseAuth
                                                                .instance
                                                                .currentUser
                                                                ?.uid)
                                                        .get()
                                                        .then((QuerySnapshot
                                                            querySnapshot) {
                                                      querySnapshot.docs
                                                          .forEach((doc) {
                                                        print(doc["pendingAndie"][0]
                                                            ["andieName"]);
                                                      });
                                                    });
                                                    print("pressed index $index");
                                                  },
                                                ),
                                              );
                                            }
                                            */ /* itemBuilder: (_, index) {
                                            return Text(snapshot.data![index].data().toString());
                                          }*/ /*
                                            );
                                      } else {
                                        return CircularProgressIndicator();
                                      }
                                    })*/

                              child: StreamBuilder<QuerySnapshot>(
                                stream: db
                                    .collection('pendingAndie')
                                    .where('clientUID',
                                    isEqualTo:
                                    FirebaseAuth.instance.currentUser?.uid)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    Text('HELLO');
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
                                    return ListView(
                                      children: snapshot.data!.docs.map((doc) {
                                        Timestamp t = (doc.data()
                                        as Map<String, dynamic>)['dateTime'];
                                        var clientNote = ((doc.data()
                                        as Map<String, dynamic>)['clientNote']);

                                        return Card(
                                          child: ListTile(
                                              onTap: () async {
                                                final QuerySnapshot snap =
                                                await FirebaseFirestore.instance
                                                    .collection('pendingAndie')
                                                    .where('clientNote',
                                                    isEqualTo: clientNote)
                                                    .get();
                                                setState(() {
                                                  name = snap.docs[0]['andieName'];
                                                  clientNote2 = ((doc.data() as Map<
                                                      String,
                                                      dynamic>)['clientNote']);
                                                  startDate = (doc.data() as Map<
                                                      String, dynamic>)['startDate'];
                                                  andieCont = (doc.data() as Map<
                                                      String, dynamic>)['andieCont'];
                                                  fb = (doc.data() as Map<String,
                                                      dynamic>)['andieFacebook'];
                                                  ratings = (doc.data() as Map<String,
                                                      dynamic>)['andieTotalRate']
                                                      .toString();
                                                  andieUID = (doc.data() as Map<
                                                      String, dynamic>)['andieUID'];
                                                });
                                                final QuerySnapshot snap2 =
                                                await FirebaseFirestore.instance
                                                    .collection('users')
                                                    .where('uid',
                                                    isEqualTo: andieUID)
                                                    .get();
                                                setState(() {
                                                  rateCount = snap2.docs[0]['rateCount'];
                                                  ratings = snap2.docs[0]['totalRate'].toString();
                                                  ratings2 = snap2.docs[0]['ratings'];
                                                });

                                                if(ratings=='null'){
                                                  ratings = 'No ratings yet';
                                                  print(ratings);
                                                };

                                              },
                                              leading: Text((doc.data() as Map<String,
                                                  dynamic>)['andieName']),
                                              title: Text((doc.data() as Map<String,
                                                  dynamic>)['clientNote']),
                                              subtitle: Text(t.toDate().toString())),
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
                      flex: 80,
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
                      flex: 30,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child:  Text(name,
                            style: TextStyle(
                                fontSize: 17.5, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Expanded(
                      flex: 100,
                      child: SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child:  Text(skills,
                              style: TextStyle(
                                  fontSize: 17.5, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 25,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: const Text('My Note',
                            style: TextStyle(
                                fontSize: 17.5, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Expanded(
                      flex: 100,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            const BorderRadius.all(const Radius.circular(5)),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        child: Text(clientNote2),
                        margin: const EdgeInsets.fromLTRB(20, 0, 10, 10),
                        //color: Colors.redAccent,
                        width: 600,
                        height: 50,
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
                              flex: 90,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: const Text('Date To Start:',
                                    style: TextStyle(
                                        fontSize: 17.5,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Expanded(
                              flex: 215,
                              child: Container(
                                margin:
                                    const EdgeInsets.fromLTRB(0, 5, 195, 10),
                                //color: Colors.redAccent,
                                child:  SizedBox(
                                  child: Text(startDate),
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
                        child: const Text('ANDIE Contact Information',
                            style: TextStyle(
                                fontSize: 17.5, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      height: 70,
                      margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //--------- this for TEXT LABEL-----------
                          Container(
                            margin: const EdgeInsets.only(right: 30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Contact Number:',
                                  style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('Facebook:',
                                  style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                Text('Ratings:',
                                  style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),),
                              ],
                            ),
                          ),
                          //--------- this for TEXT DATA-----------
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(andieCont),
                              Text(fb),
                              Text(ratings),
                            ],
                          )
                        ],
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
                              visible: isVisibleDelButton,
                              child: Container(
                                margin:
                                const EdgeInsets.only(left: 10, right: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                    const Color.fromRGBO(220, 57, 57, 1.0),
                                  ),
                                  onPressed: () {
                                  showDialog(context: context, builder: (context){
                                    return AlertDialog(
                                      title: Text("Warning!"),
                                      content: Text("You are About to Cancel the Job. Are you sure you want to Cancel the Job?"),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () async
                                    {
                                      final QuerySnapshot snap2 = await FirebaseFirestore.instance.collection('pendingAndie').where('clientNote', isEqualTo: clientNote2).where('andieUID', isEqualTo: andieUID).get();
                                      setState(() {
                                        snap2.docs[0].reference.delete();
                                      });
                                      name = '';
                                      clientNote2 ='';
                                      startDate = '';
                                      andieCont = '';
                                      fb = '';
                                      ratings = '';
                                      andieUID ='';
                                      skills = '';
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
                                  child: const Text('Cancel'),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: isVisibleButtons,
                              child: Container(
                                margin:
                                const EdgeInsets.only(left: 10, right: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                    const Color.fromRGBO(111, 215, 85, 1.0),
                                  ),
                                  onPressed: () async{

                                    final QuerySnapshot andie =
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        .where('uid',
                                        isEqualTo: andieUID)
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
                                        .collection("historyAndie")
                                        .doc()
                                        .set({
                                      "clientUID": FirebaseAuth.instance.currentUser?.uid,
                                      "andieUID":  andieUID,
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
                                      "dateFinished": DateTime.now(),
                                      'startDate': startDate,
                                      'clientCont': myNumber,
                                      'docUID': docUID,
                                      'status': 'history',
                                    });

                                    final QuerySnapshot snap3 = await FirebaseFirestore.instance.collection('finalAndie').where('clientNote', isEqualTo: clientNote2).where('andieUID', isEqualTo: andieUID).get();
                                    setState(() {
                                      snap3.docs[0].reference.delete();
                                    });

                                    name = '';
                                    clientNote2 ='';
                                    startDate = '';
                                    andieCont = '';
                                    fb = '';
                                    ratings = '';
                                    andieUID ='';
                                    skills = '';
                                  },
                                  child: const Text('DONE'),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: isVisibleButtons,
                              child: Container(
                                margin:
                                const EdgeInsets.only(left: 10, right: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                    const Color.fromRGBO(255, 205, 84, 1.0),
                                  ),
                                  onPressed: () async {
                                    //showRatingDialog(context);
                                    final _dialog = RatingDialog(
                                      initialRating: 1.0,
                                      // your app's name?
                                      title: const Text(
                                        'Rate this Andie!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // encourage your user to leave a high rating?
                                      message: const Text(
                                        'Tap a star to set your rating',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      // your app's logo?
                                      //image: const FlutterLogo(size: 100),
                                      submitButtonText: 'Submit',
                                      commentHint:
                                      'Share your experience and help this Andie and other clients!',
                                      onCancelled: () => print('cancelled'),
                                      onSubmitted: (response) {
                                        print(
                                            'rating: ${response.rating}, comment: ${response.comment}');

                                        /* // TODO: add your own logic
                                              if (response.rating < 3.0) {
                                                // send their comments to your email or anywhere you wish
                                                // ask the user to contact you instead of leaving a bad review
                                              } else {
                                                _rateAndReviewApp();
                                              }*/

                                        double rating = response.rating;

                                        FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(andieUID)
                                            .update({
                                          'rates': FieldValue.arrayUnion([
                                            {
                                              "ratingNumber": rating,
                                              "client": FirebaseAuth
                                                  .instance.currentUser?.uid,
                                              "note": response.comment
                                            }
                                          ]),
                                          'ratings':
                                          FieldValue.increment(rating),
                                          'rateCount':
                                          FieldValue.increment(rateCounter),
                                        });
                                      },
                                    );

                                    // show the dialog
                                    showDialog(
                                      context: context,
                                      barrierDismissible:
                                      false, // set to false if you want to force a rating
                                      builder: (context) => _dialog,
                                    );
                                  },
                                  child: const Text('RATE'),
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
