import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prjct_andie/checkbox/checkbox_state.dart';

import 'andie_log_in.dart';

void main() {
  runApp(MaterialApp(

      theme: ThemeData().copyWith(
        primaryColor: Colors.red,
        unselectedWidgetColor: Colors.black
      ),
      home: const AndieSignUp3())
  );
}

class AndieSignUp3 extends StatefulWidget {
  const AndieSignUp3({Key? key}) : super(key: key);

  @override
  _AndieSignUp3State createState() => _AndieSignUp3State();
}

class _AndieSignUp3State extends State<AndieSignUp3> {


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
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/background1.png'),
          fit: BoxFit.cover,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
             // color: Colors.red,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    //color: Colors.green,
                    child: const SizedBox(
                      width: 5,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                     // color: Colors.cyanAccent,
                      child: const Image(
                        image: AssetImage(
                          'assets/andie_logo.png',
                        ),
                        width: 500,
                        height: 60,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child:Center(
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                              Animation secondaryAnimation)=>AndieLogn(),
                              transitionDuration: Duration(seconds: 0)),
                          );
                        },
                        child: const Text('Move to Login'),
                      ),
                    ),
                    /* SizedBox(
                      width: 20,
                      height: 20,
                    ),*/
                  )
                ],
              ),
            ),
            Expanded(
              flex: 100,
              child: Container(
                height: 500,
                width: 1500,
                margin: const EdgeInsets.fromLTRB(40, 30, 40, 30),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                       // color: Colors.green,
                        child: const Text(
                          'Skills',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 10, left: 20),
                        //color: Colors.pink,
                          child: const Text(
                              'Select the skill/s that best decribes your Talents and Capabilities',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                          )),
                      Container(
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
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                     //   color: Colors.green,
                        child: const Text(
                          'BIO',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 10, left: 20),
                       //   color: Colors.pink,
                          child: const Text(
                            'Hey ANDIE! Let us write your Bio! This will help us easily create your Profile Menu!',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )),
                      Container(
                        margin: const EdgeInsets.only(top: 15, left: 20, right: 25),
                        //color: Colors.green,
                        child: const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Do you have any work experience/s? Explain it to us!',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15, left: 20, right: 25),
                        //color: Colors.green,
                        child: const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Did you go to any Technical Schools (ie. TESDA), Self- Taught, or something else?',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15, left: 20, right: 25),
                        //color: Colors.green,
                        child: const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'How long have you been in this Industry?',
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                         // color: Colors.red,
                            child:OutlinedButton(
                              onPressed: (){
                                Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                                    Animation secondaryAnimation)=>const AndieSignUp3(),
                                    transitionDuration: const Duration(seconds: 0)),
                                );
                              },
                              child: const Text(' I''m Done!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              ),
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSingleCheckBox(CheckBoxState checkbox) => CheckboxListTile(
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
