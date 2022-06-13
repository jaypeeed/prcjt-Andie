import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prjct_andie/checkbox/checkbox_state.dart';
import 'package:prjct_andie/services/auth.dart';

import '../models/userAndie.dart';
import 'client_my_andies.dart';
import 'client_profile.dart';


final db = FirebaseFirestore.instance;
var tmpArray = ['ELECTRICIAN', 'HOUSE KEEPER'];
TextEditingController _textFieldController = TextEditingController();
TextEditingController _textFieldControllerContInfo = TextEditingController();
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

class _ClientCategoryState extends State<ClientCategory> {
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

          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                color: Colors.black,
              )),
          padding: const EdgeInsets.all(15),
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
                    Text('ANDIES/S ($counter)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    ),
                    Container(
                      child: Text('Search results for: $tmpArray2'),
                      color: Colors.cyan,
                      width: 300,
                      height: 50,
                    ),
                    Container(
                      width: 1500,
                      height: 400,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: db.collection('users').where('role', isEqualTo: 'andie').where('skills', arrayContainsAny: tmpArray2).snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            Text ('HELLO');
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
                            return ListView (

                              children: snapshot.data!.docs.map((doc) {
                                var test = (doc.data() as Map<String, dynamic>)['uid'];
                                var name = ((doc.data() as Map<String, dynamic>)['name']);
                                var skills = (doc.data() as Map<String, dynamic>)['skills'].toString();
                                var age = (doc.data() as Map<String, dynamic>)['age'];
                                var gender = (doc.data() as Map<String, dynamic>)['gender'];
                                var exp = (doc.data() as Map<String, dynamic>)['experience'];
                                var school = (doc.data() as Map<String, dynamic>)['school'];
                                var yow =(doc.data() as Map<String, dynamic>)['yearsOfWork'];
                                var cont = (doc.data() as Map<String, dynamic>)['contactNumber'];
                                var email = (doc.data() as Map<String, dynamic>)['email'];
                                var facebook =  (doc.data() as Map<String, dynamic>)['facebook'];

                                return Card(
                                  child: ListTile(
                                         // ()=>print((doc.data() as Map<String, dynamic>)['uid'])
                                    onTap: ()  {
                                      showDialog(context: context, builder: (context){
                                        return AlertDialog(
                                          title: Text(name ),
                                          content: Column(
                                            children: [
                                              Text(skills),
                                              Text(age),
                                              Text(gender),
                                              Text(exp),
                                              Text(school),
                                              Text(yow),
                                              Text(cont),
                                              Text(email),
                                              Text(facebook),
                                              TextField(
                                                controller: _textFieldController,
                                                textInputAction: TextInputAction.go,
                                                keyboardType: TextInputType.numberWithOptions(),
                                                decoration: InputDecoration(hintText: "Enter your note"),
                                              ),
                                              TextField(
                                                controller: _textFieldControllerContInfo,
                                                textInputAction: TextInputAction.go,
                                                keyboardType: TextInputType.numberWithOptions(),
                                                decoration: InputDecoration(hintText: "Enter your contact info"),
                                              ),
                                            ],


                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () async {
                                                String clientNote=  _textFieldController.text.trim();
                                                String clientCont=  _textFieldControllerContInfo.text.trim();
                                                //AuthService.addToLedger(context, test, widget.uAndie.ledgerItem('s','s','d'));
                                               /* FirebaseFirestore.instance.collection('users').doc(test).update({
                                                  'pendingClients': '$clientNote $clientCont',

                                                });*/

                                               /* 'pendingAndies' :FieldValue.arrayUnion({
                                                {
                                                "andieId": test,
                                                "andieName": (doc.data() as Map<String, dynamic>)['name'],
                                                },
                                                }),*/
                                                Navigator.pop(context, false);


                                                /*getData() async {
                                                  return await FirebaseFirestore.instance.collection('users').where('id', isEqualTo: FirebaseAuth.instance.currentUser).get();
                                                }
                                                getData().then((val){
                                                  if(val.docs.length>0){
                                                    //print(val.docs[0].data()['cart']);

                                                    // Map map = val.docs[0].data()['cart'];
                                                    var list = [val.docs[0].data()['pendingAndies']];
                                                    // map.entries.forEach((e) {
                                                    //   list.add();
                                                    // });
                                                    // List items = [val.docs[0].data()['cart'].toList()];
                                                    FirebaseFirestore.instance.collection('users').doc().set({


                                                    });
                                                  }
                                                  else{
                                                    print("Not Found");
                                                  }
                                                });*/
                                              },
                                              child: Text('Offer Job'),
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

                                    leading: Text((doc.data() as Map<String, dynamic>)['ratings'] ),
                                    title: Text((doc.data() as Map<String, dynamic>)['name'] ),
                                    subtitle: Text((doc.data() as Map<String, dynamic>)['skills'].toString())
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
