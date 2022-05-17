import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/andie_sign_up_page2.dart';
import '../pages/andie_sign_up_page3.dart';
import 'client_menu.dart';


class SignUpClient extends StatefulWidget {
  const SignUpClient({Key? key}) : super(key: key);

  @override
  State<SignUpClient> createState() => _SignUpClientState();
}

class _SignUpClientState extends State<SignUpClient> {
  List<String> items = ['Male', 'Female',];
  String? selectedItem = 'Male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background1.png'),
              fit: BoxFit.cover,
            )
        ),
        child: Row(
          children:  [
            Expanded(
              flex: 1,
              child: Container(
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 5,
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
                        const Expanded(
                          flex: 5,
                          child: SizedBox(
                            width: 20,
                            height: 20,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      flex: 200,
                      child: Row(
                        children: [
                          const Expanded(
                              flex: 5,
                              child: SizedBox(
                                width: 20,
                                height: 20,
                              )),
                          const Expanded(
                            flex: 50,
                            child: Text(
                              'WELCOME\nCLIENT',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 50,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                                  Animation secondaryAnimation)=>ClientMenu(),
                                  transitionDuration: Duration(seconds: 0)),
                              );
                            },
                            child: const Text('DONE SIGN UP'),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),


            // ------------------Right Pane Configurations-------------------

            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(50),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 10),
                          child: const Text('Sign-Up as ANDIE!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        margin: const EdgeInsets.only(top: 5, left: 40, right: 40),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'First Name',
                          ),
                        ),),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        margin: const EdgeInsets.only(top: 15, left: 40, right: 40),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Last Name',
                          ),
                        ),),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        margin: EdgeInsets.only(top: 5, left: 45),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 48,
                                child: DropdownButtonFormField<String>(
                                  dropdownColor: Colors.orange[300],
                                  value: selectedItem,
                                  items: items
                                      .map((item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(item,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        )
                                        ,)
                                  ))
                                      .toList(),
                                  onChanged: (item)=> setState(()=>selectedItem = item),
                                ),
                              ),
                            ),
                            Expanded(flex:3,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 5, left: 40, right: 40),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Age',
                                    ),
                                  ),)),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        margin: const EdgeInsets.only(top:15,left: 40, right: 40),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Contact Number',
                          ),
                        ),),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin: const EdgeInsets.only(top:1,left: 40, right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(onPressed: (){},
                              icon: const Icon(Icons.arrow_circle_right_rounded,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      flex:10,
                      child: Center(
                        child: Text('or',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        margin: EdgeInsets.only(left: 40, right: 40, bottom: 30 ),
                        child: OutlinedButton(
                          onPressed: (){
                            Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                                Animation secondaryAnimation)=>const AndieSignUp3(), //Change here to open Google Login
                                transitionDuration: const Duration(seconds: 0)),
                            );
                          },

                          child: const Text('Sign Up Using Google',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                        ),
                      ),
                    ),




                    // BUTTON FOR GOOGLE SIGN IN

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
