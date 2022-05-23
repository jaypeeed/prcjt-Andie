import 'package:flutter/material.dart';

import '../pages/andie_sign_up_page.dart';


/*
void main() {
  runApp(const MaterialApp(home: homePage()));
}
*/

// ignore: camel_case_types
class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

// ignore: camel_case_types
class _homePageState extends State<homePage> {
  List<String> items = [
    'Log in as Andie',
    'Log in as Client',
    'Log in as Admin'
  ];
  String? selectedItem = 'Log in as Andie';
  List<String> signupItems = ['Sign up as ANDIE', 'Sign up as CLIENT'];
  String? signupSelectedItem = 'Sign up as ANDIE';

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
            Row(
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
                                color: Color(0xFFCD54),
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
                                      Animation secondaryAnimation)=>SignUp(),
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


                //------------------------RIGHT SIDE -----------------------------

                Expanded(
                  flex: 1,
                  child: Expanded(
                    flex: 1,
                    child: Column(
                      children: [

                        //-----------------TOP ROW----------------------------

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: const EdgeInsets.only(top: 15, right: 20),
                                child: SizedBox(
                                  width: 200,
                                  height: 150,
                                  child: DropdownButtonFormField<String>(
                                    dropdownColor: Colors.orange[300],
                                    value: selectedItem,
                                    items: items
                                        .map((item) => DropdownMenuItem(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            )))
                                        .toList(),
                                    onChanged: (item) =>
                                        setState(() => selectedItem = item),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: const EdgeInsets.only(top: 15, right: 20),
                                child: SizedBox(
                                  width: 200,
                                  height: 150,
                                  child: DropdownButtonFormField<String>(
                                    dropdownColor: Colors.orange[300],
                                    value: signupSelectedItem,
                                    items: signupItems
                                        .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            )))
                                        .toList(),
                                    onChanged: (item) =>
                                        setState(() => signupSelectedItem = item),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),


                        const Text('RIGHT'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
