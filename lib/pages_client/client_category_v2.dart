import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prjct_andie/checkbox/checkbox_state.dart';

import 'client_my_andies.dart';
import 'client_profile.dart';


final db = FirebaseFirestore.instance;
var tmpArray = ['ELECTRICIAN', 'HOUSE KEEPER'];
final str = tmpArray.join(' ');
void main() {
  runApp(const MaterialApp(home: ClientCategory()));
}


class ClientCategory extends StatefulWidget {
  const ClientCategory({Key? key}) : super(key: key);



  @override
  State<ClientCategory> createState() => _ClientCategoryState();

}

class _ClientCategoryState extends State<ClientCategory> {
  bool isVisible = true;
  final notifications = [
    CheckBoxState(title: 'PANDAY'),
    CheckBoxState(title: 'PLUMBER'),
    CheckBoxState(title: 'PAINTER'),
    CheckBoxState(title: 'GARDENER'),
    CheckBoxState(title: 'COOK'),
    CheckBoxState(title: 'TECHNICIAN'),
    CheckBoxState(title: 'ELECTRICIAN'),
    CheckBoxState(title: 'PLUMBER'),
    CheckBoxState(title: 'HOUSE KEEPER'),
    CheckBoxState(title: 'LAUNDERER'),
  ];


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
                    Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation)=>const ClientMyAndie(),
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
                    Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation)=>ClientCategory(),
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
                    Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation)=>ClientProfile(),
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
      body:
      Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          width:1500,
          height: 650,
          child: Column(
            children: [
              Visibility(
                visible: isVisible,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('CATEGORY',
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold
                      ),),

                    Container (
                      margin: const EdgeInsets.only(top: 5),
                      //   color: Colors.blue,
                      width: 1200,
                      height: 180,
                      child: GridView(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 10,
                          crossAxisSpacing: 50,
                          mainAxisSpacing: 10,
                        ),
                        children: [
                          ...notifications.map(buildSingleCheckBox).toList(),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(right: 65),
                        child: ElevatedButton(
                          child: const Text('DONE'),
                          onPressed: () async {
                            print(tmpArray.toString());
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
                    Text('ANDIES/S (number of results here)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    ),
                    Container(
                      child: Text('Check box Results'),
                      color: Colors.cyan,
                      width: 100,
                      height: 50,
                    ),
                    Container(
                      width: 1500,
                      height: 400,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: db.collection('users').where('role', isEqualTo: 'andie').where('skills', arrayContainsAny: tmpArray).snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            Text ('HELLO');
                            return const Center(

                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return ListView (
                              children: snapshot.data!.docs.map((doc) {
                                return Card(
                                  child: ListTile(
                                    title: Text((doc.data() as Map<String, dynamic>)['name'] ),
                                  ),
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




  Widget buildSingleCheckBox(CheckBoxState checkbox) =>
      CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.orangeAccent,
        value: checkbox.value,
        title: Text(checkbox.title,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        onChanged: (value) => setState(() =>checkbox.value =value!),
      );
}
