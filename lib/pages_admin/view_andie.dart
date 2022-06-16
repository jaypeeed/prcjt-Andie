import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/andie_profile_andie.dart';

final db = FirebaseFirestore.instance;
String counter = '';

void main() {
  runApp(const MaterialApp(home: ViewAndie()));
}
class ViewAndie extends StatefulWidget {
  const ViewAndie({Key? key}) : super(key: key);

  @override
  State<ViewAndie> createState() => _ViewAndieState();
}

class _ViewAndieState extends State<ViewAndie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
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
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: (){
                    Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation)=>const AndieProfile(),
                        transitionDuration: const Duration(seconds: 0)),
                    );
                  },
                  child: const Text('Log out',
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
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background2.png'),
                fit: BoxFit.cover,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ---  THIS ROW IS FOR THE TEXT ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Center(
                    child: Text(
                      'LIST OF ANDIE/s: ',
                      style: GoogleFonts.roboto(
                        fontSize:45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              // ---  THIS ROW IS FOR THE CLIENT/ANDIE VIEWS ---
              Expanded(flex:5 ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.white.withOpacity(0.5),
                        width:1300,
                        height: 500,
                        child: StreamBuilder<QuerySnapshot>(
                          stream: db
                              .collection('users')
                              .where('role', isEqualTo: 'andie')
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
                                            var uid = (doc.data() as Map<String, dynamic>)['uid'];
                                  return Card(
                                    child: ListTile(
                                      // ()=>print((doc.data() as Map<String, dynamic>)['uid'])
                                        onTap: () async{
                                          showDialog(context: context, builder: (context){
                                            return AlertDialog(
                                              title: const Center(
                                                child: Text("Report",
                                                    style: TextStyle(
                                                        fontSize: 40,
                                                        fontWeight: FontWeight.bold)
                                                ),
                                              ),
                                              content: Container(
                                                height: 250,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: const Text('Name',
                                                          style:TextStyle(
                                                              fontSize: 30,
                                                              fontWeight: FontWeight.bold)
                                                      ),
                                                      margin: const EdgeInsets.only(bottom: 20),
                                                    ),
                                                    const Text('Client Note:',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold)),
                                                    Container(
                                                      width: 300,
                                                      margin: const EdgeInsets.only(left: 15),
                                                      child: const Text('She did not pay me! She said bayran lang tika candy! Like mga 500 kabuok kay wala pa koy money. T.T',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    final QuerySnapshot snap2 = await FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: uid).get();
                                                    setState(() {
                                                      snap2.docs[0].reference.delete();
                                                    });
                                                    Navigator.pop(context, false);
                                                  },
                                                  child: Text('Yes, Delete'),
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
                                        leading: Text((doc.data()
                                        as Map<String, dynamic>)['reportCount'].toString()),
                                        title: Text((doc.data()
                                        as Map<String, dynamic>)['name']),
                                        subtitle: Text((doc.data()
                                        as Map<String, dynamic>)['email']
                                            .toString())),
                                  );
                                }).toList(),
                              );
                            }
                          },
                        ),
                      )
                    ],
                  )
              ),
            ],
          )
      ),
    );
  }
}
