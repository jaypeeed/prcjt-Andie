import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prjct_andie/checkbox/checkbox_state.dart';
import 'package:prjct_andie/services/auth.dart';

import '../models/userAndie.dart';
import 'client_my_andies.dart';
import 'client_profile.dart';

final db = FirebaseFirestore.instance;
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
var tmpArray = ['ELECTRICIAN', 'HOUSE KEEPER'];
TextEditingController _textFieldController = TextEditingController();
TextEditingController _textFieldControllerContInfo = TextEditingController();
TextEditingController _textFieldControllerDate = TextEditingController();
//final str = tmpArray2.join(' ');

/*void main() {
  runApp(const MaterialApp(home: ClientCategory()));
}*/

class ClientCategory extends StatefulWidget {
  late final userAndie uAndie;

  @override
  State<ClientCategory> createState() => _ClientCategoryState();
}

var tmpArray2 = [''];
String counter = '';
String myEmail = '';
String myGender = '';
String myAge = '';
String myName = '';
String myFb = '';
String myNumber = '';
double rateCount = 0.0;
double ratings2 = 0.0;
TimeOfDay time = TimeOfDay.now();
DateTime date = DateTime.now();

class _ClientCategoryState extends State<ClientCategory> {
  String getDate() {
    if (date == null) {
      return 'Select Date';
    } else {
      final months = date.month.toString().padLeft(2, '0');
      final days = date.day.toString().padLeft(2, '0');
      final years = date.year.toString();

      return '$months/$days/$years';
    }
  }

  String getTime() {
    if (date == null) {
      return 'Select Date';
    } else {
      final hours = time.hour.toString().padLeft(2, '0');
      final minutes = time.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

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

    final QuerySnapshot snap2 = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: andieUID)
        .get();
    setState(() {
      rateCount = snap2.docs[0]['rateCount'];
      ratings2 = snap2.docs[0]['ratings'];
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(andieUID)
        .update({'totalRate': ratings2 / rateCount});
  }

  bool isVisible = true;

  Map<String, bool> values = {
    'PANDAY': false,
    'PLUMBER': false,
    'PAINTER': false,
    'GARDENER': false,
    'COOK': false,
    'TECHNICIAN': false,
    'ELECTRICIAN': false,
    'HOUSE KEEPER': false,
    'LAUNDERER': false,
  };

  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpArray2.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(tmpArray2);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 205, 84, 1.0),
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
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                color: Colors.black,
              )),
          padding: const EdgeInsets.all(15),
          width: 1500,
          height: 650,
          child: Column(
            children: [
              Visibility(
                visible: isVisible,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'CATEGORY',
                      style:
                          TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 5),
                        //   color: Colors.blue,
                        width: 1200,
                        height: 180,
                        child: GridView(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 10,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 10,
                          ),
                          children: values.keys.map((String key) {
                            return CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(key),
                              value: values[key],
                              activeColor: Colors.pink,
                              checkColor: Colors.white,
                              onChanged: (bool? value) async {
                                setState(() {
                                  values[key] = value!;
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(right: 65),
                        child: ElevatedButton(
                          child: const Text('DONE'),
                          onPressed: () async {
                            getCheckboxItems();
                            print(tmpArray2.toString());
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: !isVisible,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'ANDIES/S',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Container(
                      child: Text('Search results for: $tmpArray2'),
                      //color: Colors.cyan,
                      width: 300,
                      height: 50,
                    ),
                    Container(
                      width: 1500,
                      height: 400,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: db
                            .collection('users')
                            .where('role', isEqualTo: 'andie')
                            .where('skills', arrayContainsAny: tmpArray2)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            Text('HELLO');
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            //snapshot.data.docs[index].id;
                            snapshot.data!.docs.forEach(
                              (element) {
                                // heres your data
                                element.id;
                                print(element.id);
                              },
                            );
                            print(snapshot.data!.docs.length.toString());
                            counter = snapshot.data!.docs.length.toString();
                            return ListView(
                              children: snapshot.data!.docs.map((doc) {
                                var test =
                                    (doc.data() as Map<String, dynamic>)['uid'];
                                var name = ((doc.data()
                                    as Map<String, dynamic>)['name']);
                                var skills = (doc.data()
                                        as Map<String, dynamic>)['skills']
                                    .toString();
                                var age =
                                    (doc.data() as Map<String, dynamic>)['age'];
                                var gender = (doc.data()
                                    as Map<String, dynamic>)['gender'];
                                var exp = (doc.data()
                                    as Map<String, dynamic>)['experience'];
                                var school = (doc.data()
                                    as Map<String, dynamic>)['school'];
                                var yow = (doc.data()
                                    as Map<String, dynamic>)['yearsOfWork'];
                                var cont = (doc.data()
                                    as Map<String, dynamic>)['contactNumber'];
                                var email = (doc.data()
                                    as Map<String, dynamic>)['email'];
                                var facebook = (doc.data()
                                    as Map<String, dynamic>)['facebook'];

                                return Card(
                                  child: ListTile(
                                      // ()=>print((doc.data() as Map<String, dynamic>)['uid'])
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return StatefulBuilder(
                                                  builder: (context, setState) {
                                                return AlertDialog(
                                                  title: Text(
                                                    name,
                                                    style:
                                                        GoogleFonts.robotoMono(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  content: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                          width: 350,
                                                          child: Text(skills)),
                                                      Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          //------------------------------ CONTAINS THE TEXT ONLY -----------------------
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(
                                                                'Age:',
                                                                style: GoogleFonts.roboto(
                                                                  fontSize: 20,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Gender:',
                                                                style: GoogleFonts.roboto(
                                                                  fontSize: 20,
                                                                  fontWeight:FontWeight.bold,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Ep:',
                                                                style: GoogleFonts.roboto(
                                                                  fontSize: 20,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                              Text(
                                                                'School:',
                                                                style:
                                                                    GoogleFonts.roboto(fontSize: 20,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Yow:',
                                                                style: GoogleFonts.roboto(
                                                                  fontSize: 20,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Cont:',
                                                                style:
                                                                    GoogleFonts.roboto(
                                                                  fontSize: 20,
                                                                  fontWeight:FontWeight.bold,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Email:',
                                                                style: GoogleFonts.roboto(
                                                                  fontSize: 20,
                                                                  fontWeight:FontWeight.bold,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Facebook:',
                                                                style:GoogleFonts.roboto(
                                                                  fontSize: 20,
                                                                  fontWeight:FontWeight.bold,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 30,
                                                          ),
                                                          //------------------------------ CONTAINS THE DATA F TEXT ONLY KRSIH DIRI KA! -----------------------
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                age,
                                                                style:GoogleFonts.roboto(fontSize: 20,
                                                                ),
                                                              ),
                                                              Text(
                                                                gender,
                                                                style:GoogleFonts.roboto(
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                              Text(
                                                                exp,
                                                                style:GoogleFonts.roboto(
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                              Text(
                                                                school,
                                                                style:GoogleFonts.roboto(
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                              Text(
                                                                yow,
                                                                style:GoogleFonts.roboto(
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                              Text(
                                                                cont,
                                                                style:GoogleFonts.roboto(
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                              Text(
                                                                email,
                                                                style:GoogleFonts.roboto(
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                              Text(
                                                                facebook,
                                                                style:GoogleFonts.roboto(
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      TextField(
                                                        controller:
                                                            _textFieldController,
                                                        textInputAction:
                                                            TextInputAction.go,
                                                        keyboardType: TextInputType
                                                            .numberWithOptions(),
                                                        decoration: InputDecoration(
                                                            hintText:
                                                                "Enter your note"),
                                                      ),
                                                      TextField(
                                                        controller:
                                                            _textFieldControllerContInfo,
                                                        textInputAction:
                                                            TextInputAction.go,
                                                        keyboardType: TextInputType
                                                            .numberWithOptions(),
                                                        decoration: InputDecoration(
                                                            hintText:
                                                                "Enter your contact info"),
                                                      ),
                                                      const Text('Date'),
                                                      SizedBox(
                                                        width: 200,
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            pickDate(context);
                                                          },
                                                          child:
                                                              Text(getDate()),
                                                        ),
                                                      ),
                                                      const Text('Time:'),
                                                      SizedBox(
                                                        width: 200,
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            pickTime(context);
                                                          },
                                                          child:
                                                              Text(getTime()),
                                                        ),
                                                      ),
                                                      IconButton(
                                                        icon: const Icon(
                                                            Icons.refresh),
                                                        onPressed: () {
                                                          setState(() {
                                                            getDate();
                                                            getTime();
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  actions: [
                                                    ElevatedButton(
                                                      onPressed: () async {
                                                        String date = getDate();
                                                        String time= getTime();
                                                        String clientNote = _textFieldController.text.trim();
                                                        String clientCont =
                                                            _textFieldControllerContInfo
                                                                .text
                                                                .trim();
                                                        String clientDate =
                                                            _textFieldControllerDate
                                                                .text
                                                                .trim();

                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "pendingAndie")
                                                            .doc()
                                                            .set({
                                                          "clientUID":
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser
                                                                  ?.uid,
                                                          "andieUID": test,
                                                          "andieName": name,
                                                          "andieSkills": skills,
                                                          "andieAge": age,
                                                          "andieGender": gender,
                                                          "andieExp": exp,
                                                          "andieSchool": school,
                                                          "andieYow": yow,
                                                          "andieCont": cont,
                                                          "andieEmail": email,
                                                          "andieFacebook":
                                                              facebook,
                                                          "andieTotalRate": (doc
                                                                      .data()
                                                                  as Map<String,
                                                                      dynamic>)[
                                                              'totalRate'],
                                                          "clientNote":
                                                              clientNote,
                                                          "dateTime":
                                                              DateTime.now(),
                                                          'startDate':
                                                              '$date $time',
                                                          'clientCont':
                                                              clientCont,
                                                          'docUID': doc.id,
                                                          'status': 'pending',
                                                        });
                                                        print('$date $time');

                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "pendingClient")
                                                            .doc()
                                                            .set({
                                                          "clientUID":
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser
                                                                  ?.uid,
                                                          'clientName': myName,
                                                          'clientEmail':
                                                              myEmail,
                                                          'clientGender':
                                                              myGender,
                                                          'clientAge': myAge,
                                                          'clientFacebook':
                                                              myFb,
                                                          "andieUID": test,
                                                          "clientNote":
                                                              clientNote,
                                                          "dateTime":
                                                              DateTime.now(),
                                                          'startDate':
                                                              '$date $time',
                                                          'clientCont':
                                                              clientCont,
                                                          'docUID': doc.id,
                                                          'status': 'pending',
                                                        });

                                                        Navigator.pop(
                                                            context, false);
                                                      },
                                                      child: Text('Offer Job'),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: const Color
                                                                .fromRGBO(
                                                            111, 215, 85, 1.0),
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context, false),
                                                      child: Text('Cancel'),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: const Color
                                                                .fromRGBO(
                                                            220, 57, 57, 1.0),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              });
                                            });
                                      },
                                      leading: Text((doc.data() as Map<String,
                                              dynamic>)['totalRate']
                                          .toString()),
                                      title: Text((doc.data()
                                          as Map<String, dynamic>)['name']),
                                      subtitle: Text((doc.data()
                                              as Map<String, dynamic>)['skills']
                                          .toString())),
                                );
                              }).toList(),
                            );
                          }
                        },
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(right: 65),
                        child: ElevatedButton(
                          child: const Text('Back to Categories'),
                          onPressed: () async {
                            tmpArray2 = [''];
                            setState(() {
                              isVisible = !isVisible;
                            });
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
    );
  }

  Widget buildSingleCheckBox(CheckBoxState checkbox) => CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.orangeAccent,
        value: checkbox.value,
        title: Text(
          checkbox.title,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        onChanged: (value) => setState(() => checkbox.value = value!),
      );

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() => date = newDate);
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay.now();
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time = newTime);
  }
}
