import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/andie_profile_andie.dart';

class ViewClient extends StatefulWidget {
  const ViewClient({Key? key}) : super(key: key);

  @override
  State<ViewClient> createState() => _ViewClientState();
}

class _ViewClientState extends State<ViewClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          backgroundColor: const Color.fromRGBO(255, 205, 84, 1.0),
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
                        Animation secondaryAnimation)=>const AndieProfile(),
                        transitionDuration: const Duration(seconds: 0)),
                    );
                  },
                  child: const Text('Log out',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background2.png'),
                fit: BoxFit.cover,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ---  THIS ROW IS FOR THE TEXT ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Center(
                    child: Text(
                      'LIST OF CLIENT',
                      style: GoogleFonts.robotoMono(
                        fontSize:45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              // ---  THIS ROW IS FOR THE CLIENT/ANDIE VIEWS ---
              Expanded(flex:5 ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.white.withOpacity(0.5),
                        width:1300,
                        height: 500,
                        child: Text('CLIENT List View Here'),
                      )
                    ],
                  )
              ),
            ],
          )
      ),
    );
  }
}
