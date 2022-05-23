import 'package:flutter/material.dart';
import 'package:prjct_andie/checkbox/checkbox_state.dart';
import 'package:prjct_andie/models/profile.dart';
import 'package:prjct_andie/services/auth.dart';
import 'package:provider/provider.dart';

import '../services/database.dart';

void main() {
  runApp( MaterialApp(home: Extra()));
}

class Extra extends StatelessWidget {

  final AuthService _service=AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Profile?>?>.value(
      value: DatabaseService(uid: '').profile,
      initialData: [],
      child: Scaffold(
              backgroundColor: Colors.brown,
        appBar: AppBar(
          title: Text('HELLOOOO'),
            backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget> [
       ElevatedButton(
        child: const Text('Log out'),
        onPressed: () async {
          await _service.signOut();
        },


        ),
       ],
      )
     )
    );
  }
}

