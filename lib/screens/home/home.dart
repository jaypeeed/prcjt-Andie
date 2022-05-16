import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prjct_andie/services/auth.dart';
import 'package:prjct_andie/services/database.dart';
import 'package:provider/provider.dart';
import 'package:prjct_andie/screens/home/profile_list.dart';


class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService(uid: '').profile,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.orangeAccent[50],
        appBar: AppBar(
          title: Text('Andie'),
          backgroundColor: Colors.orangeAccent[400],
          elevation: 0.0,
          actions: <Widget>[
            ElevatedButton(
              child: Text('Log out'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: ProfileList(),
      ),
    );
  }
}
