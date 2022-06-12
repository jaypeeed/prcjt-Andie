import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prjct_andie/pages_admin/view_andie.dart';
import 'package:prjct_andie/pages_admin/view_client.dart';
 import '../../pages/andie_my_job.dart';
import '../../pages/andie_profile_andie.dart';
import '../../pages/andie_ratings.dart';
import 'notes.dart';

void main() {
  runApp(const MaterialApp(home: AdminHome()));
}

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[50],
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
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background2.png'),
              fit: BoxFit.cover,
            )),
        child: Column(
          children: [
            // ---  THIS ROW IS FOR THE TEXT ---
            Expanded(flex:4 ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'HI Admin!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 100.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const Center(
                        child: Text(
                          'What would you like to do today?',
                          style: TextStyle(
                            fontSize: 45.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),
            // ---  THIS ROW IS FOR THE CLIENT/ANDIE VIEWS ---
            Expanded(flex:5 ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                            Animation secondaryAnimation)=>const ViewClient(),
                            transitionDuration: const Duration(seconds: 0)),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: 500,
                        height: 500,
                        margin: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.all(const Radius.circular(10)),
                        ),
                        child: Text('View Client',
                          style: GoogleFonts.robotoMono(
                            fontSize:45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                            Animation secondaryAnimation)=>const ViewAndie(),
                            transitionDuration: const Duration(seconds: 0)),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: 500,
                        height: 500,
                        margin: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.all(const Radius.circular(10)),
                        ),
                        child: Text('View Andie',
                          style: GoogleFonts.robotoMono(
                            fontSize:45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ),
                    ),
                  ],
                )
            ),
          ],
        )
      ),
      //ProfileList(),
    );
  }
}

