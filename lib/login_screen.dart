import 'package:flutter/material.dart';
import 'package:prjct_andie/auth_service.dart';
import 'package:prjct_andie/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;

  final formKey = GlobalKey<FormState>();

  checkFields() {
    final form = formKey.currentState;
    if (form!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String? validateEmail(String value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }

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
          children: [
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
                              'WELCOME ANDIE / CLIENT',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 50,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                                  Animation secondaryAnimation)=>homePage(),
                                  transitionDuration: Duration(seconds: 0)),
                              );
                            },
                            child: const Text('Move to page 2 new'),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),








            // RIGHT SIDE PANE
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 250.0,
                width: 300.0,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Form(
                    key: formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          flex:1,
                          child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              decoration: const InputDecoration(hintText: 'Email'),
                              validator: (value) => value!.isEmpty
                                  ? 'Email is required'
                                  : validateEmail(value.trim()),
                              onChanged: (value) {
                                email = value;
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              obscureText: true,
                              decoration:
                                  const InputDecoration(hintText: 'Password'),
                              validator: (value) => value!.isEmpty
                                  ? 'Password is required/Wrong password'
                                  : null,
                              onChanged: (value) {
                                password = value;
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: InkWell(
                                onTap: () {
                                  if (checkFields()) {
                                    AuthService().signIn(email, password);
                                  }
                                },
                                child: Container(
                                  height: 40.0,
                                  width: 100.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: const Center(child: Text('Sign in')),
                                )),
                          ),
                        )
                      ],
                    ))
              ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
