import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
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
  bool isVisibleButtons = true;

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
                                  isVisibleButtons = true;
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
                                  isVisibleButtons = true;
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
                                                  final QuerySnapshot snap =
                                                      await FirebaseFirestore.instance
                                                          .collection('pendingAndie')
                                                          .where('clientNote',
                                                              isEqualTo: clientNote)
                                                          .get();
                                                  setState(() {
                                                    name = (doc.data() as Map<String,
                                                        dynamic>)['andieName'];
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
                                                            dynamic>)['andieTotal1']
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
                                                    ratings = snap2.docs[0]['totalRate']
                                                        .toString();
                                                    ratings2 = snap2.docs[0]['ratings'];
                                                    skills = snap2.docs[0]['skills'].toString();
                                                  });
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
                                                  name = (doc.data() as Map<String,
                                                      dynamic>)['andieName'];
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
                                                  ratings = snap2.docs[0]['totalRate']
                                                      .toString();
                                                  ratings2 = snap2.docs[0]['ratings'];
                                                });
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
                      flex: 110,
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
                      flex: 25,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child:  Text(skills,
                            style: TextStyle(
                                fontSize: 17.5, fontWeight: FontWeight.bold)),
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
                        child: Text(clientNote2),
                        margin: const EdgeInsets.fromLTRB(20, 0, 10, 10),
                        color: Colors.redAccent,
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
                                color: Colors.redAccent,
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
                      margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                      child: Row(
                        children: [
                          //--------- this for TEXT LABEL-----------
                          Container(
                            margin: const EdgeInsets.only(right: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 0),
                                    child: const Text(
                                      'Contact Number:',
                                    )),
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 0),
                                    child: const Text('Messenger:')),
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 0),
                                    child: const Text('Ratings:')),
                              ],
                            ),
                          ),
                          //--------- this for TEXT DATA-----------
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(andieCont),
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 0),
                                color: Colors.redAccent,
                                width: 150,
                                height: 25,
                              ),
                              Container(
                                child: Text(fb),
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 0),
                                color: Colors.redAccent,
                                width: 250,
                                height: 25,
                              ),
                              Container(
                                child: Text(ratings),
                                padding:
                                const EdgeInsets.only(top: 5, bottom: 0),
                                color: Colors.redAccent,
                                width: 150,
                                height: 25,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 100,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(20, 20, 10, 10),
                        child: Visibility(
                          visible: isVisibleButtons,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 100,
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 10, right: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          const Color.fromRGBO(111, 215, 85, 1.0),
                                    ),
                                    onPressed: () {},
                                    child: const Text('DONE'),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 100,
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
