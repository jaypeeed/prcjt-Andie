import 'package:flutter/material.dart';

import 'andie_my_job.dart';
import 'andie_profile_andie.dart';

void main() {
  runApp(const MaterialApp(home: AndieRatings1()));
}

class AndieRatings1 extends StatefulWidget {
  const AndieRatings1({Key? key}) : super(key: key);

  @override
  State<AndieRatings1> createState() => _AndieRatings1State();
}

class _AndieRatings1State extends State<AndieRatings1> {
  @override
  Widget build(BuildContext context) {
    var card = SizedBox(
      height: 170,
      width: 170,
      child: Card(
        color: Colors.orange,
        elevation: 9,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.fromLTRB(4.0, 3.0, 10.0, 2.0),
                child: const Text(
                  "Name: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(

                  margin: const EdgeInsets.fromLTRB(2.0, 2.0, 10.0, 10.0),
                  child: const Text(
                    "Date: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ))
          ],
        ),
      ),
    );

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
            elevation: 1.0,
            actions: <Widget>[
              Center(
                child: Container(
                  margin: const EdgeInsets.only(right: 65),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                    Animation animation,
                                    Animation secondaryAnimation) =>
                                const AndieMyJobs(),
                            transitionDuration: const Duration(seconds: 0)),
                      );
                    },
                    child: const Text(
                      'My Jobs',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(right: 65),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Ratings',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(right: 65),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                    Animation animation,
                                    Animation secondaryAnimation) =>
                                const AndieProfile(),
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
              ),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(30.0),
          margin: const EdgeInsets.all(30.0),
          width: 1500,
          height: 800,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'RATINGS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                  color: Colors.black,
                ),
              ),
              Container(
                width: 300,
                height: 300,
                color: Colors.red,
              ),
              /*SizedBox(
                width: double.infinity,
                height: 180,
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: 50,
                      itemBuilder: (context, index){
                        return const SizedBox(
                          height: 120,
                          child: Card(
                            elevation: 9,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Text(
                              "Name: ",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        );
                      },
                  ),
                ),
              ),*/

              /*Padding(
                padding: const EdgeInsets.all(5.0),*/
              Container(
                margin: const EdgeInsets.all(5.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    card,
                    card,
                    card,
                    card,
                    card,
                    card,
                    card,
                    card,
                    card,
                    card,
                    card,
                    card,
                    card,
                    card,
                    card,
                    card,
                    card,
                    card,
                    card,
                    card,
                    card,
                    card,
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
