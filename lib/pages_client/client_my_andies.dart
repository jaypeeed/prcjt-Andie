import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../services/auth.dart';
import 'client_category_v2.dart';
import 'client_profile.dart';

final db = FirebaseFirestore.instance;
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
var tmpArray = ['ELECTRICIAN', 'HOUSE KEEPER'];
TextEditingController _textFieldController = TextEditingController();
TextEditingController _textFieldControllerContInfo = TextEditingController();
TextEditingController _textFieldControllerDate = TextEditingController();

void main() => runApp(const MaterialApp(home: ClientMyAndie()));

class ClientMyAndie extends StatefulWidget {
  const ClientMyAndie({Key? key}) : super(key: key);

  @override
  State<ClientMyAndie> createState() => _ClientMyAndieState();
}

class _ClientMyAndieState extends State<ClientMyAndie> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future<void> showRatingDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _textReviewController =
              TextEditingController();
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: const Text(
                'Review: [Andie Name]',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              content: SizedBox(
                width: 600,
                height: 350,
                child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Job/s: [JOB LISTS]"),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Date: [CURRENT DATE]"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RatingStars(
                            value: value,
                            onValueChanged: (v) {
                              setState(() {
                                value = v;
                              });
                            },
                            starBuilder: (index, color) => Icon(
                              Icons.star,
                              color: color,
                            ),
                            starCount: 5,
                            starSize: 30,
                            valueLabelColor: const Color(0xff9b9b9b),
                            valueLabelTextStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0),
                            valueLabelRadius: 10,
                            maxValue: 5,
                            starSpacing: 2,
                            maxValueVisibility: true,
                            valueLabelVisibility: true,
                            animationDuration:
                                const Duration(milliseconds: 100),
                            valueLabelPadding: const EdgeInsets.symmetric(
                                vertical: 1, horizontal: 8),
                            valueLabelMargin: const EdgeInsets.only(right: 8),
                            starOffColor: const Color(0xffe7e8ea),
                            starColor: Colors.amber,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                              controller: _textReviewController,
                              validator: (value) {
                                return value!.isNotEmpty
                                    ? null
                                    : "Invalid Field";
                              },
                              style: const TextStyle(
                                  /*height: 3,*/
                                  ),
                              minLines: 7,
                              maxLines: 7,
                              keyboardType: TextInputType.multiline,
                              // maxLines: null,
                              decoration: const InputDecoration(
                                  hintText:
                                      "What do you feel about his/her service? Share your thoughts!   ",
                                  labelText: "Review/Comment",
                                  border: OutlineInputBorder())),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                child: const Text('DONE'),
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    Navigator.of(context).pop();
                                  }
                                },
                              ),
                            ),
                            const SizedBox(width: 100),
                            SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                child: const Text('CANCEL'),
                                onPressed: () => Navigator.pop(context, false),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            );
          });
        });
  }

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

  double value = 3.5;
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
                          margin: const EdgeInsets.only(left: 30, top: 30),
                          child: const Text(
                            'My Andies',
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
                          child: FutureBuilder(
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
                                      /* itemBuilder: (_, index) {
                                      return Text(snapshot.data![index].data().toString());
                                    }*/
                                      );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              })),
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
                      flex: 50,
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
                        child: Text(note),
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
                              ],
                            ),
                          ),
                          //--------- this for TEXT DATA-----------
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 0),
                                color: Colors.redAccent,
                                width: 150,
                                height: 25,
                              ),
                              Container(
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
                                    showRatingDialog(context);
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

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => SizedBox(
            width: 835,
            height: 538,
            child: AlertDialog(
              title: const Text(
                'Review:Finn Is not a dog',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              content: SizedBox(
                width: 600,
                height: 300,
                /*padding: const EdgeInsets.only(left: 30),*/
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text("Job/s: "),
                      Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text("Date: ")),
                      Center(
                        child: RatingStars(
                          value: value,
                          onValueChanged: (v) {
                            //
                            setState(() {
                              value = v;
                            });
                          },
                          starBuilder: (index, color) => Icon(
                            Icons.star,
                            color: color,
                          ),
                          starCount: 5,
                          starSize: 30,
                          valueLabelColor: const Color(0xff9b9b9b),
                          valueLabelTextStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          valueLabelRadius: 10,
                          maxValue: 5,
                          starSpacing: 2,
                          maxValueVisibility: true,
                          valueLabelVisibility: true,
                          animationDuration: const Duration(milliseconds: 100),
                          valueLabelPadding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 8),
                          valueLabelMargin: const EdgeInsets.only(right: 8),
                          starOffColor: const Color(0xffe7e8ea),
                          starColor: Colors.amber,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        width: 600,
                        child: const TextField(
                            style: TextStyle(
                                /*height: 3,*/
                                ),
                            minLines: 2,
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            // maxLines: null,
                            decoration: InputDecoration(
                                labelText:
                                    "What do you feel about his/her service? Share your thoughts!   ",
                                border: OutlineInputBorder())),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 65, top: 20),
                            child: ElevatedButton(
                              child: const Text('DONE'),
                              onPressed: () async {},
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 65, top: 20),
                            child: ElevatedButton(
                              child: const Text('CANCEL'),
                              onPressed: () => Navigator.pop(context, false),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ));
}
