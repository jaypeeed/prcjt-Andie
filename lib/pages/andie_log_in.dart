import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'andie_sign_up_page3.dart';

void main() {
  runApp(const MaterialApp(home: AndieLogn()));
}

class AndieLogn extends StatefulWidget {
  const AndieLogn({Key? key}) : super(key: key);

  @override
  State<AndieLogn> createState() => _AndieLognState();
}

class _AndieLognState extends State<AndieLogn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background1.png'),
              fit: BoxFit.cover,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                //color: Colors.pinkAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ------------------ROW FOR ANDIE LOGO-----------------
                    Row(
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
                        const Expanded(
                          flex: 5,
                          child: SizedBox(
                            width: 20,
                            height: 20,
                          ),
                        )
                      ],
                    ),

                    // ------------------lEFT PANE CONFIGURATIONS-----------------
                    Expanded(
                      flex: 10,
                      child: Container(
                        margin: const EdgeInsets.only(left: 50),
                        /* color: Colors.redAccent,*/
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 100),
                              //color: Colors.lightGreen,
                              child: const Text(
                                'HEY, YOU' 'RE\nBACK!',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 50,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              //color: Colors.yellowAccent,
                              child: const Text(
                                'A lot of people need your help.',
                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (BuildContext context,
                                          Animation animation,
                                          Animation secondaryAnimation) =>
                                      const AndieSignUp3(),
                                      transitionDuration:
                                      const Duration(seconds: 0)),
                                );
                              },
                              child: const Text('Move to page 2 new'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ------------------Right Pane Configurations-------------------
            /*  Expanded(
              flex: 1,
              child: Container(
                color: Colors.,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.all(50),
                      child: Column(
                        children: const [
                          Text('Sign-Up as ANDIE!'),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30, left: 40, right: 40),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Email',
                        ),
                      ),),

                  ],
                ),
              ),
            ),*/
            Expanded(
              /*flex:1,*/
              child: Container(
                margin: const EdgeInsets.only(
                    top: 100, left: 50, right: 50, bottom: 180),
                padding: EdgeInsets.only(top: 35),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 13,
                      child: Container(
                        // color: Colors.redAccent,
                        margin: const EdgeInsets.only(top: 20, left: 30),
                        child: const Text(
                          'Login as ANDIE!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 13,
                      child: Container(
                        //color: Colors.green,
                        margin:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Email',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 13,
                      child: Container(
                        // color: Colors.blue,
                        margin:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Password',
                          ),
                        ),
                      ),
                    ),
                    /* Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(top:15,left: 40, right: 40),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Confirm Password',
                          ),
                        ),),
                    ),*/
                    Expanded(
                      flex: 13,
                      child: Container(
                        // color: Colors.deepOrange,
                        margin:
                        const EdgeInsets.only(top: 0, left: 40, right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_circle_right_rounded,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 13,
                        child: Center(child: Text('or',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ))),
                    Expanded(
                      flex: 25,
                      child: Center(
                        child: Container(
                          margin:
                          EdgeInsets.only(left: 40, right: 40, bottom: 30),
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (BuildContext context,
                                        Animation animation,
                                        Animation secondaryAnimation) =>
                                    const AndieSignUp3(), //Change here to open Google Login
                                    transitionDuration:
                                    const Duration(seconds: 0)),
                              );
                            },
                            child: const Text(
                              'Sign Up Using Google',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )

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
