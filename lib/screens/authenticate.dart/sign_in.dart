import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prjct_andie/screens/authenticate.dart/register.dart';
import 'package:prjct_andie/services/auth.dart';
import 'package:prjct_andie/testing/services(sign_in)/auth_services.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  void googleSignIn() async {}

  //text field state
  String email = '';
  String password = '';
  String error = '';

  bool _isObscure = true;
  void initState() {
    _isObscure = true;
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
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 200,
                  height: 60,
                  // color: Colors.cyanAccent,
                  child: const Image(
                    image: AssetImage(
                      'assets/andie_logo.png',
                    ),
                  ),
                ),
                // SizedBox(width: 30,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                    ),
                  ),
                  child: TextButton(
                    child: const Text(
                      'Sign Up',
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
                            transitionDuration: const Duration(seconds: 0)),
                      );
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 200,
              child: Row(
                children: [
                  // --------------- Left Side --------------------
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.only(top: 30, left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 50,
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 75,
                                        color: Colors.white,
                                        letterSpacing: 3,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 4.0,
                                            color:
                                                Colors.black.withOpacity(.25),
                                            offset: const Offset(0.0, 4.0),
                                          ),
                                        ]),
                                    children: [
                                  TextSpan(
                                    style: GoogleFonts.inter(),
                                    text:
                                        "THERE ARE A\nLOT OF\nPEOPLE THAT\nNEED YOUR\nHELP THAN YOU\n",
                                  ),
                                  const TextSpan(
                                    text: 'THINK!',
                                    style: const TextStyle(
                                      color: Colors.red,
                                    ),
                                  )
                                ])),
                          ),
                          /*ElevatedButton(
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
                          ),*/
                        ],
                      ),
                    ),
                  ),

                  //------------------- RIGHT SIDE-------------------------
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 300,
                      width: 300,
                      padding: const EdgeInsets.only(
                          top: 20, left: 40, right: 40, bottom: 40),
                      margin: const EdgeInsets.only(
                          left: 50, right: 50, top: 80, bottom: 100),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20)),
                        image: DecorationImage(
                          image: const AssetImage('spin_gear.gif'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.1), BlendMode.dstATop),
                        ),
                      ),
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
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 40,
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
                                        validator: (value) {
                                          return value!.isNotEmpty
                                              ? null
                                              : "Empty/Invalid Email";
                                        },
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
                                        keyboardType: TextInputType.text,
                                        obscureText: _isObscure,
                                        validator: (value) {
                                          return value!.isNotEmpty
                                              ? null
                                              : "Empty/Invalid Password";
                                        },
                                        controller: passwordController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Password',
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _isObscure
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _isObscure = !_isObscure;
                                              });
                                            },
                                          ),
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
                                      child: Container(
                                        height: 70,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: const Color.fromRGBO(
                                                  255, 205, 84, 1.0),
                                            ),
                                            child: const Text(
                                              'Log In',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                            onPressed: () {
                                              final String email =
                                                  emailController.text.trim();
                                              final String password =
                                                  passwordController.text
                                                      .trim();
                                              if (_formkey.currentState!
                                                  .validate()) {
                                                context
                                                    .read<AuthServices>()
                                                    .login(email, password);
                                              }
                                              //   if (email.isEmpty) {
                                              //     print("Email is Empty");
                                              //   } else {
                                              //     if (password.isEmpty) {
                                              //       print("Password is Empty");
                                              //     } else {
                                              //       context
                                              //           .read<AuthServices>()
                                              //           .login(email, password);
                                              //     }
                                              //   }
                                              // }
                                            }),
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
