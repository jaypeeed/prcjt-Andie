
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';
import '../pages/andie_my_job.dart';
import '../pages/andie_profile_andie.dart';
import '../services/auth.dart';

/*void main() async{
  runApp(const MaterialApp(home: ClientAndieCategories()));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}*/

class ClientAndieCategories extends StatefulWidget {
  const ClientAndieCategories({Key? key}) : super(key: key);

  @override
  State<ClientAndieCategories> createState() => _ClientAndieCategoriesState();
}

class _ClientAndieCategoriesState extends State<ClientAndieCategories> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          backgroundColor: Color.fromRGBO(255, 205, 84, 1.0),
          title: Image.asset('assets/andie_logo.png',
            width: 180,
          ),
          elevation: 0.0,
          actions: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.only(right: 65),
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: (){
                    Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation)=>AndieMyJobs(),
                        transitionDuration: Duration(seconds: 0)),
                    );
                  },
                  child: const Text('My Andie',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
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
                  child: const Text('Category',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
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
                  onPressed: (){
                    Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation)=>AndieProfile(),
                        transitionDuration: Duration(seconds: 0)),
                    );
                  },
                  child: const Text('Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(right: 65),
                child: ElevatedButton(
                  child: Text('Log out'),
                  onPressed: () async {
                    /*await _auth.signOut();*/
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
