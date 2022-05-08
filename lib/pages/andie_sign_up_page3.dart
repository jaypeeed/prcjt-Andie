import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prjct_andie/checkbox/checkbox_state.dart';

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
                    Container(
                      margin: const EdgeInsets.all(50),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 20, left: 20),
                                child: const Text(
                                  'Skills',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                  top: 20, left: 40, right: 40, bottom: 10),
                              child: const Text(
                                  'Select the skill/s that best decribes your Talents and Capabilities',
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                              )),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 40, right: 40),
                            width: 1200,
                            height: 250,
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
                          Center(
                            child: Container(
                                margin: const EdgeInsets.only(
                                    top: 5, left: 40, right: 40, bottom: 30),
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
                  ],
                ),
              ),
            ),

            // ------------------Right Pane Configurations-------------------
          ],
        ),
      ),
    );

  }

  Widget buildSingleCheckBox(CheckBoxState checkbox) => CheckboxListTile(
    controlAffinity: ListTileControlAffinity.leading,
    activeColor: Colors.orangeAccent,
    value: checkbox.value,
    title: Text(checkbox.title),
    onChanged: (value) => setState(() =>checkbox.value =value!),
  );
}
