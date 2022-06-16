import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prjct_andie/pages_client/client_my_andies.dart';

import '../services/auth.dart';
import 'andie_my_job.dart';
import 'andie_profile_andie.dart';
import 'package:universal_html/html.dart' as html;

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final db = FirebaseFirestore.instance;
String name = '';
String comment ='';
String dateSubmitted = '';
String rate = '';
String ratings = '';
String clientUID ='';
String myRateCounter = '';
String myRating = '';
String finalRate = '';

String one = '';
String two = '';
String three = '';
String four = '';
String five = '';



void main() {
  runApp( MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      home: const AndieRatings1()));
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class AndieRatings1 extends StatefulWidget {
  const AndieRatings1({Key? key}) : super(key: key);

  @override
  State<AndieRatings1> createState() => _AndieRatings1State();
}

class _AndieRatings1State extends State<AndieRatings1> {
  String counter = '';

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
        myRateCounter = userData.data()!['rateCount'].toString();
        one = userData.data()!['One'].toString();
        two = userData.data()!['Two'].toString();
        three = userData.data()!['Three'].toString();
        four = userData.data()!['Four'].toString();
        five = userData.data()!['Five'].toString();
        myRating = userData.data()!['totalRate'].toString();
        finalRate =double.parse(myRating).toStringAsPrecision(3);
        if(one == 'null'){
          one = '0';
        }if(two == 'null'){
          two = '0';
        }if(three == 'null'){
          three = '0';
        }if(four == 'null'){
          four = '0';
        }if(five == 'null'){
          five = '0';
        }


        print(myRateCounter);
      });
    });

    final QuerySnapshot snap = await FirebaseFirestore.instance.collection('ratings').where('andieUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get();
    setState(() {
      name = snap.docs[0]['clientName'];
      comment = snap.docs[0]['comment'];
      //dateSubmitted = snap.docs[0]['dateRated'];
      rate = snap.docs[0]['rate'].toString();
      andieUID = snap.docs[0]['andieUID'];
      clientUID = snap.docs[0]['clientUID'];

      Timestamp t = snap.docs[0]['dateRated'];
      dateSubmitted = t.toDate().toString();
    });


  }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    var card = SizedBox(
      height: 170,
      width: 170,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          //color: const Color.fromRGBO(255, 205, 84, 1.0),
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Container(
            margin: EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.greenAccent[400],
                  radius: 30,
                  child: const Image(
                    height: 30,
                    width: 30,
                    image: AssetImage(
                      'male.png',
                    ),
                  )
                ), //C
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.fromLTRB(4.0, 3.0, 10.0, 2.0),
                      child: const Text(
                        "Name: ",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(5.0, 2.0, 10.0, 10.0),
                      child: const Text(
                        "Date: ",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),Container(
                      margin: const EdgeInsets.fromLTRB(5.0, 2.0, 10.0, 10.0),
                      child: const Text(
                        "Comment:",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Container(
                      margin:EdgeInsets.only(left: 30),
                      color: Colors.cyan,
                      width: 130,
                      height: 90,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 205, 84, 1.0),
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
                    child:  const Text('Ratings',
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
              Expanded(
                flex: 10,
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                  margin: const EdgeInsets.all(30.0),
                  width: 1500,
                  height: 800,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        //color: Colors.green,
                        child:  Expanded(
                          flex: 5,
                          child: Text(
                            'RATINGS ($finalRate)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 50,
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.only(left: 20),
                            width: 500,
                            height: 300,
                           // color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // ----------- Numbers-------------
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      '5',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50.0,
                                      color: Colors.black,
                                    ),
                                    ),
                                    Text(
                                      '4',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50.0,
                                      color: Colors.black,
                                    ),
                                    ),
                                    Text(
                                      '3',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50.0,
                                      color: Colors.black,
                                    ),
                                    ),
                                    Text(
                                      '2',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50.0,
                                      color: Colors.black,
                                    ),
                                    ),
                                    Text(
                                      '1',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50.0,
                                      color: Colors.black,
                                    ),
                                    ),
                                  ],
                                ),
                                // ----------- Stars-------------
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon( Icons.star_outlined,size: 50,),
                                        Icon( Icons.star_outlined,size: 50,),
                                        Icon( Icons.star_outlined,size: 50,),
                                        Icon( Icons.star_outlined,size: 50,),
                                        Icon( Icons.star_outlined,size: 50,),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon( Icons.star_outlined,size: 50,),
                                        Icon( Icons.star_outlined,size: 50,),
                                        Icon( Icons.star_outlined,size: 50,),
                                        Icon( Icons.star_outlined,size: 50,),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon( Icons.star_outlined,size: 50,),
                                        Icon( Icons.star_outlined,size: 50,),
                                        Icon( Icons.star_outlined,size: 50,),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon( Icons.star_outlined,size: 50,),
                                        Icon( Icons.star_outlined,size: 50,),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon( Icons.star_outlined,size: 50,),
                                      ],
                                    ),
                                  ],
                                ),
                                // ----------- Number of Rates -------------
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Text(
                                      '($five)',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50.0,
                                      color: Colors.black,
                                    ),
                                    ),
                                    Text(
                                      '($four)',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50.0,
                                      color: Colors.black,
                                    ),
                                    ),
                                    Text(
                                      '($three)',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50.0,
                                      color: Colors.black,
                                    ),
                                    ),
                                    Text(
                                      '($two)',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50.0,
                                      color: Colors.black,
                                    ),
                                    ),
                                    Text('($one)',
                                      style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50.0,
                                      color: Colors.black,
                                    ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                          child: Text('Total Rate: $myRateCounter',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50.0,
                              color: Colors.black,
                            ),
                          ))

                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                  margin: const EdgeInsets.all(20.0),
                  width: 1500,
                  height: 800,
                  color: Colors.white,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: db.collection('ratings')
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
                            Timestamp t = (doc.data() as Map<String, dynamic>)['dateRated'];
                            var name =(doc.data() as Map<String, dynamic>)['clientName'];
                            var rate =(doc.data() as Map<String, dynamic>)['rate'].toString();
                            var comment = (doc.data() as Map<String, dynamic>)['comment'];
                            dateSubmitted =t.toDate().toString();

                            return Card(
                              child: ListTile(

                                  leading: CircleAvatar(backgroundImage: AssetImage("assets/male.png")),
                                  title: Text('$name: $comment'),
                                  subtitle: Column(
                                    children: [
                                      Text('Rate: $rate'),
                                      Text('Date Rated: $dateSubmitted'),
                                    ],
                                  )
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
        ));
  }
}
