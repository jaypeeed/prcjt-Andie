import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prjct_andie/screens/authenticate.dart/register.dart';
import 'package:prjct_andie/services/auth.dart';
import 'package:prjct_andie/testing/services(sign_in)/auth_services.dart';
import 'package:provider/provider.dart';

import '../../pages/andie_log_in.dart';
import '../../pages/andie_sign_up_page.dart';
import '../../pages_client/client_sign_up_page.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/background1.png'),
          fit: BoxFit.cover,
        )),
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 500,
                    height: 60,
                    // color: Colors.cyanAccent,
                    child: const Image(
                      image: AssetImage(
                        'assets/andie_logo.png',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Expanded(
                        flex: 30,
                        child: SizedBox(
                          width: 30,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                            ),
                          ),
                          child: TextButton(
                            child: const Text(
                              'Sign Up?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                //decoration: TextDecoration.underline,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (BuildContext context,
                                            Animation animation,
                                            Animation secondaryAnimation) =>
                                        Register(),
                                    transitionDuration: Duration(seconds: 0)),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
                  /* SizedBox(
                      width: 20,
                      height: 20,
                    ),*/
                ),
              ],
            ),

            // --------------- Right Side --------------------
            Expanded(
              flex: 200,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      //color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                              flex: 5,
                              child: SizedBox(
                                width: 20,
                                height: 20,
                              )),
                          Expanded(
                            flex: 50,
                            child: Container(
                              margin: const EdgeInsets.only(left: 50),
                              child: const Text(
                                "THERE ARE A\nLOT OF\nPEOPLE THAT\nNEED YOUR\nHELP THAN YOU\nTHINK!",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 65,
                                  color: Colors.white,
                                  letterSpacing: 3,
                                ),
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
                                        const SignUp(),
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

                  //------------------- RIGHT SIDE-------------------------
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 500,
                      width: 500,
                      padding: const EdgeInsets.only(
                          top: 50, left: 40, right: 40, bottom: 40),
                      margin: const EdgeInsets.only(
                          left: 50, right: 50, top: 80, bottom: 100),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),

                      //  color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Container(
                              //color: Colors.green,
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 40,
                            child: Container(
                              //color: Colors.red,
                              /*   margin:
                                  const EdgeInsets.only(left: 40, right: 40),*/
                              child: Form(
                                key: _formkey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(height: 20.0),
                                    Expanded(
                                      flex: 100,
                                      child: TextFormField(
                                        controller: emailController,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Email',
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                        flex: 20,
                                        child: SizedBox(height: 20.0)),
                                    Expanded(
                                      flex: 100,
                                      child: TextFormField(
                                        controller: passwordController,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Password',
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                        flex: 1, child: SizedBox(height: 20.0)),
                                    const Expanded(
                                        flex: 1, child: SizedBox(height: 12.0)),
                                    Expanded(
                                      flex: 20,
                                      child: Text(
                                        error,
                                        style: const TextStyle(
                                            color: Colors.red, fontSize: 14.0),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Container(
                              //color: Colors.blue,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 20,
                                    child: Center(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.indigo),
                                          child: const Text(
                                            'Log In',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () {
                                            final String email =
                                                emailController.text.trim();
                                            final String password =
                                                passwordController.text.trim();

                                            if (email.isEmpty) {
                                              print("Email is Empty");
                                            } else {
                                              if (password.isEmpty) {
                                                print("Password is Empty");
                                              } else {
                                                context
                                                    .read<AuthServices>()
                                                    .login(email, password);
                                              }
                                            }
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
