import 'package:flutter/material.dart';
import 'package:prjct_andie/services/auth.dart';

import '../../checkbox/checkbox_state.dart';
import '../../pages/andie_sign_up_page3.dart';


class Register extends StatefulWidget {
  final Function toggleView;

  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
        child: Column(
          children: [
            //------this is the app bar------
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
                Expanded(
                  flex: 10,
                  child: Center(
                      child: ElevatedButton(
                        child: const Text('Sign Up'),
                        onPressed: () {
                          widget.toggleView();
                        },
                      )),
                  /* SizedBox(
                        width: 20,
                        height: 20,
                      ),*/
                )
              ],
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
                        padding: EdgeInsets.only(left: 400, right: 400),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 20.0),
                              TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Email',
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey)
                                      )
                                  ),
                                  validator: (val) => val!.isEmpty ? 'Enter your email' : null,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  }),
                              SizedBox(height: 20.0),
                              TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey)
                                      )
                                  ),
                                  validator: (val) => val!.length < 6
                                      ? 'Enter your password with 6 chars long'
                                      : null,
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  }),
                              SizedBox(height: 20.0),

                              SizedBox(height: 12.0),
                              Text(
                                error,
                                style: TextStyle(color: Colors.red, fontSize: 14.0),
                              )
                            ],
                          ),
                        ),
                      ),

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
                          child:ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
                              child: const Text(
                                'Register',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                if (_formkey.currentState!.validate()) {
                                  dynamic result = await _auth.registerWithEmailAndPassword(
                                      email, password);
                                  if (result == null) {
                                    setState(() => error = 'Please supply a valid email');
                                  }
                                }
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),






          ],
        ),
      )




      /*Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                  )
                ),
                  validator: (val) => val!.isEmpty ? 'Enter your email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Password',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                      )
                  ),
                  validator: (val) => val!.length < 6
                      ? 'Enter your password with 6 chars long'
                      : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              SizedBox(height: 20.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() => error = 'Please supply a valid email');
                      }
                    }
                  }),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),*/
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


